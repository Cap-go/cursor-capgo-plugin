---
name: capacitor-live-update-architect
description: Design Capacitor features with safe OTA boundaries, channel strategy, compatibility gates, and rollback planning.
---

# Capacitor Live Update Architect

Use this skill when planning implementation that may ship as live updates.

## Objectives

- Deliver features without crossing OTA/native boundaries accidentally.
- Keep rollout reversible and observable.
- Catch compatibility breakage before channel promotion.

## Step-by-Step Workflow

1. Split scope into `web-layer` and `native-layer` changes.
2. Mark each item as `OTA-eligible` or `store-release-required`.
3. Validate plugin availability and platform constraints.
4. Define `capacitor.config.ts` changes with production-safe values.
5. Define channel strategy and rollout cadence.
6. Define compatibility gates and required command checks.
7. Define rollback strategy with specific previous bundle.
8. Define test plan (unit, integration, E2E, cold-start).
9. Define post-deploy monitoring and stop conditions.

## Required Output Template

- `Scope split`: web vs native
- `Release type`: OTA or native
- `Channel plan`: staging, beta, production
- `Compatibility gates`: commands + pass criteria
- `Rollback`: target bundle + trigger thresholds
- `Monitoring`: metrics/events to watch in first 24h
- `Risks`: top 3 risks and mitigations

## Command Patterns To Reference

```bash
capgo doctor
capgo bundle compatibility <appId> --channel <channel>
capgo bundle releaseType <appId> --channel <channel>
capgo channel currentBundle <channel> <appId>
capgo bundle upload <appId> --channel <channel>
capgo channel set <channel> <appId> --bundle <bundleVersion>
```

## Common Failure Modes

- OTA attempted for native-impacting change.
- Startup regression due to missing `notifyAppReady()` call.
- Promotion done without reading current channel bundle first.
- No rollback target identified before production rollout.
