---
name: capgo-compatibility-check
description: Run a layered compatibility review (local, channel, release type) and return ship/hold decision.
---

# Capgo Compatibility Check

Run and summarize compatibility checks for target channel promotion.

## Steps

1. Run local checker:
   - `./scripts/check-capacitor-compatibility.sh --strict`
2. Run channel compatibility:
   - `capgo bundle compatibility <appId> --channel <targetChannel>`
3. Run release type gate:
   - `capgo bundle releaseType <appId> --channel <targetChannel>`
4. Capture current channel bundle:
   - `capgo channel currentBundle <targetChannel> <appId>`

## Required Output

- `Local checks`: pass/fail with blockers
- `Channel compatibility`: pass/fail with details
- `Release type`: OTA/native
- `Decision`: promote | hold
- `Fix list`: exact remediation steps
