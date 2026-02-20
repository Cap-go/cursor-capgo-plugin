---
name: live-update-release-auditor
description: Audit Capacitor live-update release readiness with security, testing, and rollout checks.
---

# Live Update Release Auditor

Use this skill before publishing app binaries or pushing live updates.

## Audit Checklist

1. Confirm Capacitor package versions are aligned and lockfile is updated.
2. Confirm platform sync was run after native dependency changes.
3. Confirm production config does not enable cleartext traffic or debug WebView settings.
4. Confirm security scan status and unresolved findings.
5. Confirm tests passed at relevant levels for touched areas.
6. Confirm live-update strategy:
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
