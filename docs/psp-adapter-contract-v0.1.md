# PSP Adapter Contract v0.1

A real PSP integration MUST implement: createPaymentIntent, confirm/status, refund, createPayout where supported, verifyWebhook, fetchSettlement and reconcile references. Provider webhooks must be signature-verified and idempotent. RECIPRA never treats a browser redirect as proof of payment. Production activation requires provider credentials, webhook secret, test/sandbox evidence and a reconciliation test before live mode.
