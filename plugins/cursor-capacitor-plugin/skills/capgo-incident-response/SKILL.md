---
name: capgo-incident-response
description: Handle live-update incidents with rapid triage, rollback execution, and post-incident hardening.
---

# Capgo Incident Response

Use this skill when a live update causes regressions, startup failures, or elevated crash rates.

## Triage Sequence

1. Confirm incident scope (platforms, channel, app version, error profile).
2. Fetch currently linked bundle for impacted channel.
3. Identify previous known-good bundle.
4. Decide rollback now vs partial containment.

## Immediate Command Toolkit

```bash
capgo channel currentBundle <channel> <appId>
capgo bundle list <appId>
capgo channel set <channel> <appId> --bundle <knownGoodBundle>
capgo app debug <appId>
```

## Containment Patterns

- Roll back production channel to last good bundle.
- Restrict channel targeting if issue is platform-specific.
- Pause promotion pipeline until compatibility gates pass again.

## Post-Incident Actions

1. Record timeline with first bad bundle and rollback timestamp.
2. Run compatibility checker on the failed bundle.
3. Add missing guardrails/tests that would have caught the issue.
4. Prepare fix-forward bundle and redeploy through staged channels.

## Output Template

- `Incident summary`
- `Impact`
- `Actions taken`
- `Current state`
- `Root cause hypothesis`
- `Preventive controls`
