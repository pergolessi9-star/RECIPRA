BEGIN;
-- Centralize/verify RLS for every tenant-scoped table created after migration 019.
DO $$ DECLARE r record; BEGIN
FOR r IN SELECT n.nspname s,c.relname t FROM pg_class c JOIN pg_namespace n ON n.oid=c.relnamespace JOIN pg_attribute a ON a.attrelid=c.oid AND a.attname='tenant_id' WHERE c.relkind='r' AND n.nspname IN ('identity','tenant','core','affiliate','tracking','referral','ledger','payment','module','privacy','governance','ai','evidence','audit')
LOOP
 EXECUTE format('ALTER TABLE %I.%I ENABLE ROW LEVEL SECURITY',r.s,r.t);
 EXECUTE format('ALTER TABLE %I.%I FORCE ROW LEVEL SECURITY',r.s,r.t);
 EXECUTE format('DROP POLICY IF EXISTS tenant_isolation ON %I.%I',r.s,r.t);
 EXECUTE format('CREATE POLICY tenant_isolation ON %I.%I USING (tenant_id = core.current_tenant_id()) WITH CHECK (tenant_id = core.current_tenant_id())',r.s,r.t);
END LOOP; END $$;
-- Sessions are tenant-scoped in the executable architecture.
ALTER TABLE identity.sessions ALTER COLUMN tenant_id SET NOT NULL;
-- Provider event uniqueness must include tenant: the same PSP may reuse IDs across isolated tenants.
ALTER TABLE payment.provider_events DROP CONSTRAINT IF EXISTS provider_events_provider_id_external_event_id_key;
ALTER TABLE payment.provider_events ADD CONSTRAINT provider_events_tenant_provider_event_uq UNIQUE(tenant_id,provider_id,external_event_id);
-- OAuth state/token uniqueness is tenant-aware while hashes remain collision-resistant.
ALTER TABLE identity.oauth_states DROP CONSTRAINT IF EXISTS oauth_states_state_hash_key;
ALTER TABLE identity.oauth_states ADD CONSTRAINT oauth_states_tenant_state_uq UNIQUE(tenant_id,state_hash);
ALTER TABLE tracking.click_tokens DROP CONSTRAINT IF EXISTS click_tokens_token_hash_key;
ALTER TABLE tracking.click_tokens ADD CONSTRAINT click_tokens_tenant_token_uq UNIQUE(tenant_id,token_hash);
-- Harden currency casing in newly-created distribution table.
ALTER TABLE affiliate.conversion_distributions ADD CONSTRAINT conversion_distribution_currency_upper CHECK(currency=upper(currency));
COMMIT;