BEGIN;
CREATE TABLE core.providers (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), code citext NOT NULL UNIQUE, name text NOT NULL, provider_type text NOT NULL, status core.record_status NOT NULL DEFAULT 'ACTIVE', metadata jsonb NOT NULL DEFAULT '{}'::jsonb);
CREATE TABLE core.provider_connections (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), tenant_id uuid NOT NULL REFERENCES tenant.tenants(id) ON DELETE CASCADE, provider_id uuid NOT NULL REFERENCES core.providers(id), credential_ref text, scopes text[] NOT NULL DEFAULT '{}', config jsonb NOT NULL DEFAULT '{}'::jsonb, status core.record_status NOT NULL DEFAULT 'ACTIVE', UNIQUE(tenant_id,provider_id));
COMMIT;
