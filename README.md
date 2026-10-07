# Capgo for Cursor

Ship, live-update, and roll back Capacitor apps from Cursor.

## MCP servers

- `capgo`: hosted MCP at `https://api.capgo.app/mcp`. Nothing to install. Cursor shows **Needs login**; click it and sign in to Capgo (OAuth). Manages apps, bundles, channels, rollouts, devices, stats, native builds, webhooks, and push notifications. Docs: https://capgo.app/docs/ai/mcp/
- `capgo-cli`: local Capgo CLI MCP (`npx @capgo/cli@latest mcp`). Needed to upload a bundle from your build folder, request a native build, or run `doctor`.

## Included Plugin

- `capgo` (folder `plugins/cursor-capacitor-plugin`)

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
