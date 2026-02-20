---
name: capgo-channel-setup
description: Create and configure Capgo channels with safe defaults for staged rollout and controlled targeting.
---

# Capgo Channel Setup

Create a safe baseline channel topology for live updates.

## Target Topology

- `staging`
- `beta`
- `production`

## Command Plan

```bash
npx @capgo/cli@latest channel add staging <appId>
npx @capgo/cli@latest channel add beta <appId>
npx @capgo/cli@latest channel add production <appId> --default
npx @capgo/cli@latest channel list <appId>
npx @capgo/cli@latest channel set staging <appId> --self-assign
```

## Configuration Guidance

- Keep production channel stable and manually promoted.
- Use staging/beta for canary and compatibility validation.
- Capture current bundle before any production reassignment.
