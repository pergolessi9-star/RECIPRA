BEGIN;
ALTER TABLE ledger.entries ADD CONSTRAINT currency_upper CHECK(currency = upper(currency)); ALTER TABLE ledger.accounts ADD CONSTRAINT account_currency_upper CHECK(currency=upper(currency)); ALTER TABLE payment.payments ADD CONSTRAINT payment_currency_upper CHECK(currency=upper(currency)); ALTER TABLE payment.payout_requests ADD CONSTRAINT payout_currency_upper CHECK(currency=upper(currency)); ALTER TABLE tracking.conversions ADD CONSTRAINT conversion_currency_upper CHECK(currency IS NULL OR currency=upper(currency));
COMMIT;
