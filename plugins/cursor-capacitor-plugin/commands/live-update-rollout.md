---
name: live-update-rollout
description: Build a staged rollout plan for Capgo updates with compatibility checkpoints and rollback triggers.
---

# Live Update Rollout

Create a rollout runbook for the next live-update bundle.

## Required Inputs

- `appId`
- `bundleVersion`
- `targetFeatureScope`
- `targetChannels`

## Plan Requirements

1. `Preflight`
- `capgo doctor`
- local compatibility script
- channel compatibility + release-type checks

2. `Staged publication`
- Upload to `staging`
- Promote to `beta`
- Promote to `production`

3. `Gate criteria`
- startup success threshold
- crash delta threshold
- update failure threshold

4. `Rollback`
- previous bundle ID
- exact rollback command
- incident owner and SLA

## Output Format

- `Command sequence`
- `Gate checks`
- `Monitoring plan`
- `Rollback plan`
