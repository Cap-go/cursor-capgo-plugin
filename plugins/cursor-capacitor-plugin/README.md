# Cursor Capacitor Plugin

A Cursor plugin by Capgo that makes AI assistance align with production-grade Capacitor and Capgo practices.

## What This Plugin Does

It injects consistent rules and workflows into Cursor so feature work, reviews, and release prep follow mobile-safe standards by default.

## Primary Use Cases

- Building new Capacitor features with fewer platform mistakes
- Reviewing changes before PR merge or release
- Preparing Capgo OTA rollouts with rollback-first planning
- Auditing security/testing readiness for mobile releases

## What Is Enforced

### 1) Core Capacitor Practices

- Use `bun` / `bunx` (not `npm` / `npx`)
- Keep Capacitor package versions aligned
- Run `bunx cap sync` after native plugin changes
- Prefer `capacitor.config.ts` with production-safe values
- Check plugin/platform availability before native calls

### 2) Capgo Live Update Guardrails

- Treat Capgo as web-layer OTA only
- Keep native changes on store-release path
- Require staged channel rollout (`staging`/`beta` then `production`)
- Require explicit rollback and monitoring strategy
- Call `CapacitorUpdater.notifyAppReady()` after startup succeeds

### 3) Security and Testing Standards

- Avoid sensitive data in plain storage or logs
- Use secure network defaults for production
- Include security scan in release candidates (`bunx capsec scan --ci`)
- Require test coverage at the right layer (unit/integration/E2E)

## Plugin Components

- `rules/`
  - `capacitor-core-practices.mdc`
  - `capgo-live-update-guardrails.mdc`
  - `capacitor-security-and-testing.mdc`
- `skills/`
  - `capgo-capacitor-architect`
  - `capgo-release-auditor`
- `agents/`
  - `capgo-reviewer`
- `commands/`
  - `capgo-audit`
  - `capgo-live-update-rollout`
- `hooks/`
  - blocks shell usage of `npm`/`npx`
  - emits end-of-session release checklist reminders

## Example Prompts In Cursor

- `Use capgo-capacitor-architect to design this feature for iOS + Android with rollout notes.`
- `Run capgo-audit on this repo and list blockers before release.`
- `Build a capgo-live-update-rollout plan for this patch release.`
- `Review this PR as capgo-reviewer and prioritize high-severity risks.`

## Scope Limit

This plugin improves implementation and review quality in Cursor. It does not replace actual CI, device testing, store submission, or production monitoring.
