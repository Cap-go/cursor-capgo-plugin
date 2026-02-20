# Capgo Cursor Plugin Pack

This repository contains Cursor marketplace plugins maintained by Capgo for teams building and shipping Capacitor apps.

## What This Is

`cursor-capacitor-plugin` is a Cursor plugin that adds opinionated guardrails for:
- Capacitor engineering best practices
- Capgo live update safety
- Mobile release readiness
- Security and testing discipline

The goal is simple: make Cursor consistently push safer implementation and release decisions for Capacitor projects.

## Why It Is Useful

Without explicit guardrails, AI-assisted coding often misses mobile-specific risks. This plugin reduces that by enforcing:
- correct package manager usage (`bun` / `bunx`)
- correct native sync flow (`bunx cap sync` after native plugin changes)
- OTA vs native release boundaries (Capgo updates are web-layer only)
- safer config defaults (no production cleartext/debug leftovers)
- explicit rollout and rollback planning

## What It Changes In Practice

When active in Cursor, the plugin provides:
- Always-on rules that shape coding and review output
- Skills for implementation planning and pre-release audits
- A reviewer agent focused on Capacitor + Capgo regressions
- Commands for structured audit and rollout planning
- Hooks that block `npm` / `npx` usage in shell commands

## Repository Layout

- `.cursor-plugin/marketplace.json`: marketplace-level manifest
- `plugins/cursor-capacitor-plugin/`: the actual plugin package
- `scripts/validate-template.mjs`: structure and frontmatter validator

## Local Validation

```bash
bun scripts/validate-template.mjs
```

## Publishing Flow

1. Keep metadata updated in:
   - `.cursor-plugin/marketplace.json`
   - `plugins/cursor-capacitor-plugin/.cursor-plugin/plugin.json`
2. Validate the repository:
   - `bun scripts/validate-template.mjs`
3. Push the public GitHub repository and submit it to Cursor Marketplace.
