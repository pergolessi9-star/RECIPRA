# Ecosystem Audit v0.3

No further feature work is merged until this gate is green.

Verified/corrected audit areas:
- TypeScript workspace compilation.
- Full PostgreSQL migration-chain execution in CI.
- Tenant RLS architecture and FORCE RLS expectation.
- Immutable posted-ledger design and derived wallet balance.
- Conversion/provider idempotency boundaries.
- OAuth state/session and click-signature boundaries.
- PSP webhook verification boundary.
- SAE human-review and ARCHEION evidence boundaries.

Production gates still required:
- non-superuser application DB role without BYPASSRLS;
- real OAuth provider credentials/callback verification;
- real PSP sandbox credentials and signed webhook tests;
- end-to-end economic integration tests including reversal, replay, cross-tenant access and double payout.

A green TypeScript check alone is not sufficient. Database migration and invariant checks are mandatory.
