# API / Event Contracts v1.0

## Rules
Every write endpoint declares authentication, permission, tenant context, idempotency, command, emitted events, ledger effect, audit effect and evidence effect. Frontends and AI never mutate balances directly.

## POST /api/v1/conversions/postback
Authentication: provider adapter/webhook gateway (signature enforcement is adapter-specific and MUST precede this internal contract). Tenant: required. Idempotency: provider + external_id. Command: ReceiveConversion. Event: conversion.received.v1. Ledger: forbidden at receipt. Audit/evidence: raw provider event must be retained by gateway.

## POST /api/v1/payouts
Authentication: required before public exposure. Permission: payout.request. Tenant: required. Idempotency-Key: required. Command: RequestPayout. Event: payout.requested.v1. Ledger: no direct mutation; reservation/settlement commands own economic posting. Audit/evidence: required.

## Event envelope
Fields: event_id, event_type, event_version, tenant_id, aggregate_type, aggregate_id, occurred_at, actor, correlation_id, causation_id, payload, metadata.

## Transactional outbox
Domain write and outbox insert occur in one PostgreSQL transaction. Delivery is at-least-once; consumers must be idempotent.
