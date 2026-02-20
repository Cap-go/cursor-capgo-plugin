# Cursor Capacitor Plugin Pack

This repository contains a production-focused Cursor plugin for Capacitor teams shipping live updates.

## Included Plugin

- `cursor-capacitor-plugin`

## What It Contains

- high-signal engineering rules for Capacitor and OTA boundaries
- deep Capgo CLI skills and command playbooks
- compatibility and release-type gate workflows
- rollback and incident-response runbooks
- session hooks and local compatibility scripts

## Key Capability Areas

1. Architecture safety
- OTA vs native boundary enforcement
- startup readiness and rollout planning

2. Operations
- app/channel/bundle lifecycle with Capgo CLI
- compatibility gates before promotion

3. Release control
- pre-release audits
- production rollback command patterns

4. System checks
- local compatibility script for package/config/startup checks
- end-of-session audit reminders

## Validate Plugin Structure

```bash
bun scripts/validate-template.mjs
```

## Publish Workflow

1. Keep manifests updated:
   - `.cursor-plugin/marketplace.json`
   - `plugins/cursor-capacitor-plugin/.cursor-plugin/plugin.json`
2. Validate structure.
3. Push public repo and submit to Cursor Marketplace.
