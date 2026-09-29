BEGIN;
CREATE TABLE tenant.organizations (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), legal_name text NOT NULL, created_at timestamptz NOT NULL DEFAULT now());
CREATE TABLE tenant.tenants (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), organization_id uuid REFERENCES tenant.organizations(id), slug citext NOT NULL UNIQUE, name text NOT NULL, status core.record_status NOT NULL DEFAULT 'ACTIVE', created_at timestamptz NOT NULL DEFAULT now());
CREATE TABLE tenant.memberships (tenant_id uuid NOT NULL REFERENCES tenant.tenants(id) ON DELETE CASCADE, user_id uuid NOT NULL REFERENCES identity.users(id) ON DELETE CASCADE, role_code text NOT NULL, created_at timestamptz NOT NULL DEFAULT now(), PRIMARY KEY(tenant_id,user_id));
CREATE TABLE tenant.brands (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), tenant_id uuid NOT NULL REFERENCES tenant.tenants(id) ON DELETE CASCADE, name text NOT NULL, config jsonb NOT NULL DEFAULT '{}'::jsonb);
CREATE TABLE tenant.domains (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), tenant_id uuid NOT NULL REFERENCES tenant.tenants(id) ON DELETE CASCADE, hostname citext NOT NULL UNIQUE, verified_at timestamptz);
COMMIT;
