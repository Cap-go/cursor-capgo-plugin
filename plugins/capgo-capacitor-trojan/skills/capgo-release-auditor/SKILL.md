---
name: capgo-release-auditor
description: Audit Capacitor + Capgo release readiness with security, test, and rollout checks.
---

# Capgo Release Auditor

Use this skill before publishing app binaries or pushing Capgo live updates.

## Audit Checklist

1. Confirm Capacitor package versions are aligned and lockfile is updated.
2. Confirm `bunx cap sync` was run after native dependency changes.
3. Confirm production config does not enable cleartext traffic or debug WebView settings.
4. Confirm security scan status (`bunx capsec scan --ci`) and unresolved findings.
5. Confirm tests passed at relevant levels for touched areas.
6. Confirm Capgo update strategy:
   - target channel
   - staged rollout path
   - rollback bundle availability
   - monitoring plan after deployment
7. Confirm native-only changes are scheduled for store release, not OTA.

## Output Format

- `Status`: pass | pass-with-risk | fail
- `Blockers`: concrete list with severity and owner
- `Release Notes`: what changed in web vs native
- `Rollback`: exact rollback action and trigger condition
