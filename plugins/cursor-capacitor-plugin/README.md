# Cursor Capacitor Plugin

A Cursor plugin that applies production-grade Capacitor and live-update practices during coding, review, and release planning.

## What This Plugin Does

It injects guidance and workflows so generated solutions are aligned with real mobile release constraints, not just web assumptions.

## Primary Use Cases

- building new Capacitor features with fewer platform mistakes
- reviewing changes before merge or release
- preparing live-update rollouts with rollback-first plans
- auditing security and testing readiness for mobile releases

## What Is Enforced

### 1) Core Capacitor Practices

- keep Capacitor package versions aligned
- run platform sync after native dependency changes
- prefer environment-aware `capacitor.config.ts`
- check plugin/platform availability before native calls
- separate web and native impact in implementation notes

### 2) Live Update Guardrails

- treat live updates as web-layer OTA only
- route native changes through store release workflow
- use staged channel rollout before production
- define rollback criteria before rollout
- require post-release monitoring signals

### 3) Security and Testing Standards

- avoid sensitive data in plain storage and logs
- use secure network defaults in production
- include security scanning in release checks
- require test coverage at the right layer (unit/integration/E2E)

## Plugin Components

- `rules/`
  - `capacitor-core-practices.mdc`
  - `live-update-guardrails.mdc`
  - `capacitor-security-and-testing.mdc`
- `skills/`
  - `capacitor-live-update-architect`
  - `live-update-release-auditor`
- `agents/`
  - `capacitor-reviewer`
- `commands/`
  - `release-audit`
  - `live-update-rollout`
- `hooks/`
  - emits end-of-session release checklist reminders

## Example Prompts In Cursor

- `Use capacitor-live-update-architect to design this feature for iOS + Android with rollout notes.`
- `Run release-audit on this repo and list blockers before release.`
- `Build a live-update-rollout plan for this patch release.`
- `Review this PR as capacitor-reviewer and prioritize high-severity risks.`

## Scope Limit

This plugin improves implementation and review quality in Cursor. It does not replace CI, device testing, store submission, or production monitoring.
