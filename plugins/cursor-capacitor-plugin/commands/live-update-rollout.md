---
name: live-update-rollout
description: Build a safe live-update rollout plan with staged channels, monitoring, and rollback criteria.
---

# Live Update Rollout

Create a rollout plan for a new live-update bundle.

## Required Output

1. `Scope`: files and features included in the bundle.
2. `Compatibility`: minimum native app version and platform caveats.
3. `Channel Plan`: staged progression (for example: `staging -> beta -> production`).
4. `Validation Gates`: what must be green before promotion.
5. `Rollback Plan`: fallback bundle, trigger thresholds, and owner.
6. `Post-Deploy Monitoring`: metrics/logs to watch for 24h.
