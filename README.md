# RECIPRA

RECIPRA is the provisional codename for a modular, multi-tenant Reward + Affiliate + Revenue Intelligence platform.

This repository starts with **Database Specification v1.0**, the PostgreSQL transactional baseline for Identity, tenants, affiliate tracking, referrals, double-entry ledger, payments/payouts, privacy, SAE governance, AI systems, ARCHEION evidence and audit/outbox infrastructure.

## Current engineering baseline

- PostgreSQL as transactional source of truth
- Multi-tenant isolation with Row Level Security
- Double-entry immutable economic ledger
- Provider adapters and idempotent webhook ingestion
- Identity model ready for Google, GitHub, Meta/Facebook and X
- Payment/payout orchestration designed for regulated PSP adapters
- SAE governance domain
- ARCHEION evidence/provenance bridge
- Transactional outbox for domain events

## Database

Apply `database/migrations/*.sql` in lexical order to a new PostgreSQL database. See `database/README.md`.

> Status: engineering baseline / pre-production. The RECIPRA name remains provisional pending final brand clearance.
