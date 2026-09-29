-- Run in a disposable test database after migrations.
BEGIN;
DO $$ BEGIN IF to_regclass('ledger.transactions') IS NULL THEN RAISE EXCEPTION 'ledger.transactions missing'; END IF; IF to_regclass('core.outbox_events') IS NULL THEN RAISE EXCEPTION 'outbox missing'; END IF; IF NOT EXISTS(SELECT 1 FROM pg_policies WHERE schemaname='ledger' AND tablename='transactions' AND policyname='tenant_isolation') THEN RAISE EXCEPTION 'RLS policy missing'; END IF; END $$;
ROLLBACK;
