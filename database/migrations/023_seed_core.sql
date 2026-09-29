BEGIN;
INSERT INTO core.providers(code,name,provider_type) VALUES ('google','Google','IDENTITY'),('github','GitHub','IDENTITY'),('meta','Meta','IDENTITY'),('x','X','IDENTITY') ON CONFLICT DO NOTHING;
INSERT INTO module.modules(module_key,publisher,name) VALUES ('core.identity','RECIPRA','Identity & Access'),('core.ledger','RECIPRA','Economic Ledger'),('core.payments','RECIPRA','Payment Orchestrator'),('core.governance','RECIPRA','SAE Governance Bridge'),('core.evidence','RECIPRA','ARCHEION Evidence Bridge') ON CONFLICT DO NOTHING;
COMMIT;
