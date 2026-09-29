# Vertical Slice v0.1

Target causal path:

tenant -> user/identity -> offer -> click -> provider conversion -> verification/policy -> balanced ledger distribution -> wallet projection -> payout request -> approval -> PSP execution -> settlement -> reconciliation -> audit/evidence.

## Implemented executable spine

- pnpm monorepo workspace
- PostgreSQL development service
- database package with tenant-scoped transactions
- typed Zod contracts
- versioned domain-event names
- conversion receive endpoint
- payout request endpoint
- transactional-outbox worker
- API/Event Contracts v1.0

## Explicit next gates

Authentication/session middleware, Google/GitHub/Meta/X OAuth adapters, signed provider webhook adapters, conversion verification/policy, ledger posting/distribution service, audit/evidence emission, real payment-service-provider adapter and end-to-end tests.

No unfinished adapter is represented as production-ready.
