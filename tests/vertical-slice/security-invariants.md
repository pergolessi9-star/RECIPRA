# Vertical Slice security/economic invariants

- Invalid provider signature cannot create a verified conversion.
- Replayed external_event_id is idempotent.
- A conversion cannot reward when offer incentive policy forbids it.
- High fraud score routes to human review rather than reward.
- Unbalanced ledger distribution is rejected.
- Posted entries cannot be edited/deleted.
- Payout cannot be executed twice.
- Browser success/return URL cannot mark a payment SUCCEEDED.
- Unverified PSP webhook cannot create a ledger effect.
- Cross-tenant access is denied.
- AI output cannot directly post ledger entries.
- Evidence/provenance is created for material verified events.
