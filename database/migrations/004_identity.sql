BEGIN;
CREATE TABLE identity.users (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), email citext, display_name text, status core.record_status NOT NULL DEFAULT 'ACTIVE', created_at timestamptz NOT NULL DEFAULT now(), updated_at timestamptz NOT NULL DEFAULT now(), UNIQUE(email));
CREATE TABLE identity.identities (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), user_id uuid NOT NULL REFERENCES identity.users(id) ON DELETE CASCADE, provider text NOT NULL, provider_subject text NOT NULL, email citext, metadata jsonb NOT NULL DEFAULT '{}'::jsonb, created_at timestamptz NOT NULL DEFAULT now(), UNIQUE(provider,provider_subject));
CREATE TABLE identity.sessions (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), user_id uuid NOT NULL REFERENCES identity.users(id) ON DELETE CASCADE, expires_at timestamptz NOT NULL, revoked_at timestamptz, created_at timestamptz NOT NULL DEFAULT now());
CREATE TABLE identity.devices (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), user_id uuid NOT NULL REFERENCES identity.users(id) ON DELETE CASCADE, fingerprint_hash text NOT NULL, trusted boolean NOT NULL DEFAULT false, last_seen_at timestamptz, UNIQUE(user_id,fingerprint_hash));
COMMIT;
