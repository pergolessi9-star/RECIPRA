# RECIPRA Database Specification v1.0

PostgreSQL baseline for the modular multi-tenant rewards/affiliate platform. Codename RECIPRA is provisional.

## Apply

Run `database/migrations/*.sql` in lexical order on a new PostgreSQL database. Migrations are intentionally explicit SQL.

## Security

Tenant-scoped tables use PostgreSQL RLS via `app.tenant_id`. Production application roles must not be superusers or possess BYPASSRLS. Credentials/tokens are referenced through `credential_ref`; secrets do not belong in ordinary tables.

## Ledger

Balances are derived from `ledger.entries`. Posted transactions are immutable. Corrections use compensating/reversal transactions. Posting requires >=2 entries, one currency and equal debit/credit totals.

## Transactional outbox

Write domain state and `core.outbox_events` in the same DB transaction. A worker publishes events and sets `published_at`. Consumers must remain idempotent.

## Important production follow-ups

Before production: define least-privilege DB roles/grants, add partitioning/retention for audit/webhooks/outbox, formal state-transition functions, encryption/KMS integration, backup/PITR, observability, load tests, PSP-specific adapters, and legal/compliance review.
