BEGIN;
ALTER TABLE identity.sessions ADD COLUMN IF NOT EXISTS token_hash text UNIQUE;
ALTER TABLE identity.sessions ADD COLUMN IF NOT EXISTS tenant_id uuid REFERENCES tenant.tenants(id) ON DELETE CASCADE;
ALTER TABLE identity.sessions ADD COLUMN IF NOT EXISTS last_seen_at timestamptz;
ALTER TABLE identity.sessions ENABLE ROW LEVEL SECURITY;ALTER TABLE identity.sessions FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS tenant_isolation ON identity.sessions;CREATE POLICY tenant_isolation ON identity.sessions USING(tenant_id=core.current_tenant_id()) WITH CHECK(tenant_id=core.current_tenant_id());
INSERT INTO core.providers(code,name,provider_type,metadata) VALUES('recipra-sandbox','RECIPRA Sandbox PSP','PAYMENT','{"sandbox":true}'::jsonb) ON CONFLICT(code) DO NOTHING;
COMMIT;