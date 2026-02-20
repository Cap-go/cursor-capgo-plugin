# Cursor Capacitor Plugin

A high-context Cursor plugin for teams shipping Capacitor apps with live updates.

This plugin is designed to be operational, not decorative. It embeds concrete delivery workflows for architecture, compatibility, rollout, rollback, and incident handling.

## What You Get

- Deep Capacitor engineering guardrails
- Complete Capgo CLI runbooks and command patterns
- Compatibility checks before channel promotion
- Release auditing and rollback workflows
- Incident-response guidance for bad OTA releases
- A strict reviewer persona focused on high-risk regressions

## Included Components

### Rules

- `capacitor-core-practices.mdc`
- `live-update-guardrails.mdc`
- `capacitor-security-and-testing.mdc`
- `capgo-cli-operations.mdc`
- `compatibility-gates.mdc`

### Skills

- `capacitor-live-update-architect`
- `live-update-release-auditor`
- `capgo-cli-operator`
- `capgo-compatibility-checker`
- `capgo-incident-response`
- `capgo-cicd-live-updates`

### Commands

- `release-audit`
- `live-update-rollout`
- `capgo-cli-playbook`
- `capgo-compatibility-check`
- `capgo-emergency-rollback`
- `capgo-channel-setup`

### Agent

- `capacitor-reviewer`

### Scripts + Hooks

- `scripts/check-capacitor-compatibility.sh`: project-local compatibility and safety checks
- `scripts/session-audit.sh`: end-of-session operational checklist
- `hooks/hooks.json`: runs compatibility and session audit checks at session end

## How To Use In Cursor

1. Ask for implementation planning with `capacitor-live-update-architect`.
2. Ask for command-level operations with `capgo-cli-operator`.
3. Run compatibility validation with `capgo-compatibility-check`.
4. Run pre-release evaluation with `release-audit`.
5. If needed, trigger rollback planning with `capgo-emergency-rollback`.

## Example Prompts

- `Use capgo-cli-operator to set up channels and publish the next staging bundle.`
- `Run capgo-compatibility-check for this repo and return blockers only.`
- `Use live-update-release-auditor and tell me if this release is pass, pass-with-risk, or fail.`
- `Use capgo-emergency-rollback and produce exact immediate steps for production.`
