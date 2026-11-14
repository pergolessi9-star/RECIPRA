# Vertical Slice v0.3

Executable target: OAuth -> session -> offer -> signed click -> verified conversion -> policy -> distribution -> ledger -> wallet -> payout -> PSP sandbox -> settlement/reconciliation -> SAE -> ARCHEION.

## Security gates
OAuth state is random, hashed at rest, expiring and one-use. Identity login is separated from optional provider scopes. Click signatures are server generated. Provider and PSP webhooks are never trusted before cryptographic verification and replay/idempotency checks. Browser redirects are not proof of payment. AI cannot post ledger transactions.

## Economic gates
A received conversion has no economic effect. Verification + policy authorization are required. Distribution must reconcile exactly to gross. Ledger posting must balance. Wallet balance is a projection of posted entries, never a mutable source of truth. Reversals use compensating entries.

## Production secrets
OAUTH_GOOGLE_CLIENT_ID/SECRET, OAUTH_GITHUB_CLIENT_ID/SECRET, OAUTH_META_CLIENT_ID/SECRET, OAUTH_X_CLIENT_ID/SECRET, CLICK_SIGNING_SECRET and PSP/provider credentials are environment/secret-manager values and must never be committed.
