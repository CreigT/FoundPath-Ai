# Architecture
FoundPath is a mobile-first Next.js application with Supabase Auth/Postgres/private storage. Public recovery pages receive only an opaque cryptographically random token. The token is not an item ID and the database stores its SHA-256 hash.

REGISTER → PROTECT PRIVATE DATA → GENERATE TAG → FINDER REPORTS → VALIDATE → COMPARE → OWNER REVIEWS → MESSAGE SAFELY → HUMAN APPROVES HANDOFF → CONFIRM RESULT → AUDIT