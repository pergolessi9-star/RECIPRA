# Security Boundaries v0.2

1. Browser cannot write ledger entries or balances.
2. Provider callbacks enter through an adapter that verifies signature/replay/idempotency before internal conversion commands.
3. OAuth login grants identity only. Extra Google/GitHub/Meta/X scopes require separate explicit authorization.
4. Payment card data is never stored in RECIPRA. PSP adapters operate on provider tokens/references.
5. AI can recommend; policy + deterministic services authorize material economic effects.
6. Posted ledger transactions are immutable; corrections are compensating transactions.
7. Tenant RLS is mandatory for application roles.
8. Material decisions emit audit/evidence records and preserve correlation/causation identifiers.
