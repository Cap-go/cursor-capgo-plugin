---
name: live-update-release-auditor
description: Audit release readiness for Capacitor live updates with strict compatibility, security, and rollback gates.
---

# Live Update Release Auditor

Use this skill before publishing to beta/production channels.

## Mandatory Audit Checks

1. Capacitor core package major versions are aligned.
2. Updater plugin is present and configured.
3. Startup readiness signaling is implemented.
4. Compatibility gate command passes for target channel.
5. Release type gate confirms OTA eligibility.
6. Security scan and test suite pass for touched areas.
7. Rollback bundle and trigger thresholds are defined.
8. Monitoring owner and timeline are explicit.

## Required Command Evidence

```bash
capgo doctor
capgo bundle compatibility <appId> --channel <targetChannel>
capgo bundle releaseType <appId> --channel <targetChannel>
capgo channel currentBundle <targetChannel> <appId>
capgo bundle list <appId>
```

## Output Format

- `Status`: pass | pass-with-risk | fail
- `Critical blockers`: must-fix before release
- `Medium risks`: can ship with mitigation
- `Rollback plan`: exact command sequence
- `Promotion decision`: proceed | hold

## Severity Rules

- Missing compatibility gate result -> `fail`
- Native-impacting changes marked OTA -> `fail`
- No rollback bundle identified -> `pass-with-risk`
- Missing platform test evidence -> `pass-with-risk`
