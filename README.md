# FoundPath AI

Privacy-first lost-item recovery SaaS.

**Sponsored by CREIGNIFICENT LLC.**

## V1 recovery loop
REGISTER → PROTECT PRIVATE DATA → GENERATE TAG → FINDER REPORTS → VALIDATE → OWNER REVIEWS → MESSAGE SAFELY → HUMAN APPROVES HANDOFF → CONFIRM RESULT → AUDIT

## Foundation
Next.js + TypeScript, Supabase Auth/Postgres/RLS, cryptographically random hashed recovery tokens, protected messaging boundary, audit architecture, Gemini advisory boundary, and server-side Stripe boundary.

## Critical security rule
A QR recovery token is never a database item ID. Tokens are generated with cryptographic randomness; only hashes should be persisted.

## Status
Foundation scaffold. It is not yet production-ready. Production requires real Supabase/storage/messaging/Gemini/Stripe/notification integrations and the security tests in tests/README.md.