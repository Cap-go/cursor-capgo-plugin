---
name: capgo-emergency-rollback
description: Create a production incident rollback runbook with exact Capgo channel commands and verification steps.
---

# Capgo Emergency Rollback

Generate immediate rollback actions for a failing live update.

## Required Inputs

- `appId`
- `channel`
- `knownGoodBundle`
- `symptoms`

## Runbook Requirements

1. Confirm current bundle:
   - `capgo channel currentBundle <channel> <appId>`
2. List available bundles:
   - `capgo bundle list <appId>`
3. Roll back channel:
   - `capgo channel set <channel> <appId> --bundle <knownGoodBundle>`
4. Validate post-rollback behavior and monitoring checks.
5. Define fix-forward path through staged channels.

## Output

- `Immediate commands`
- `Verification checklist`
- `Communication summary`
- `Next deployment guardrails`
