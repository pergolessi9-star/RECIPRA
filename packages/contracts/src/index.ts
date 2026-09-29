import { z } from "zod";
export const UUID=z.string().uuid();
export const Money=z.object({amount:z.string().regex(/^\\d+(\\.\\d{1,8})?$/),currency:z.string().regex(/^[A-Z]{3}$/)});
export const EventEnvelope=z.object({event_id:UUID,event_type:z.string().min(3),event_version:z.number().int().positive(),tenant_id:UUID.nullable(),aggregate_type:z.string(),aggregate_id:UUID,occurred_at:z.string().datetime(),actor:z.object({type:z.enum(["user","system","service","provider"]),id:z.string().nullable()}),correlation_id:UUID,causation_id:UUID.nullable(),payload:z.record(z.string(),z.unknown()),metadata:z.record(z.string(),z.unknown()).default({})});
export type DomainEvent=z.infer<typeof EventEnvelope>;
export const ConversionPostback=z.object({tenant_id:UUID,provider_id:UUID,external_id:z.string().min(1),click_id:UUID.optional(),user_id:UUID.optional(),offer_id:UUID.optional(),gross_amount:z.string().optional(),currency:z.string().regex(/^[A-Z]{3}$/).optional(),payload:z.record(z.string(),z.unknown())});
export const PayoutRequest=z.object({tenant_id:UUID,user_id:UUID,wallet_id:UUID,amount:z.string().regex(/^\\d+(\\.\\d{1,8})?$/),currency:z.string().regex(/^[A-Z]{3}$/),idempotency_key:z.string().min(8).max(200)});
