# Cursor Capacitor Plugin Pack

This repository contains a Cursor plugin focused on safer Capacitor development and live update release workflows.

## What It Is

`cursor-capacitor-plugin` is a policy and workflow layer for Cursor that nudges implementation and review toward production-safe mobile practices.

## Why It Is Useful

AI-generated code often misses mobile-specific constraints. This plugin reduces common failures by enforcing:
- clear web-vs-native release boundaries
- safer live update rollout and rollback planning
- stronger security/testing expectations
- structured review outputs for risky changes

## What It Adds To Cursor

- always-on rules for architecture, live updates, security, and testing
- reusable skills for feature implementation and release readiness audits
- a reviewer agent that prioritizes regressions and release risk
- commands for audit and rollout planning
- session-end checklist hooks

## Repository Layout

- `.cursor-plugin/marketplace.json`: marketplace-level manifest
- `plugins/cursor-capacitor-plugin/`: plugin package
- `scripts/validate-template.mjs`: structure and frontmatter validator

## Local Validation

```bash
node scripts/validate-template.mjs
```

## Publishing Flow

1. Keep metadata updated in:
   - `.cursor-plugin/marketplace.json`
   - `plugins/cursor-capacitor-plugin/.cursor-plugin/plugin.json`
2. Validate the repository:
   - `node scripts/validate-template.mjs`
3. Push the public GitHub repository and submit it to Cursor Marketplace.
