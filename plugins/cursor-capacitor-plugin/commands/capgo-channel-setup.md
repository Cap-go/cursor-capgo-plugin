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
capgo channel add staging <appId>
capgo channel add beta <appId>
capgo channel add production <appId> --default
capgo channel list <appId>
capgo channel set staging <appId> --self-assign
```

## Configuration Guidance

- Keep production channel stable and manually promoted.
- Use staging/beta for canary and compatibility validation.
- Capture current bundle before any production reassignment.
