---
name: capgo-capacitor-architect
description: Plan and implement Capacitor features with Capgo-ready architecture, native safety, and release discipline.
---

# Capgo Capacitor Architect

Use this skill when building or refactoring Capacitor apps that may ship with Capgo live updates.

## Workflow

1. Clarify scope by splitting the request into web-layer changes and native-layer changes.
2. Validate platform constraints (iOS, Android, web) before picking plugin APIs.
3. Define configuration updates in `capacitor.config.ts` with production-safe defaults.
4. Implement feature logic with plugin availability checks and explicit fallbacks.
5. If Capgo is used, define channel strategy (`staging`, `beta`, `production`) and rollback path.
6. Add tests proportionate to risk (unit, integration, E2E/smoke).
7. Run validation commands with bun tooling.
8. Summarize risks, assumptions, and release notes.

## Command Baseline

```bash
bun install
bun run lint
bun run test
bun run build
bunx cap sync
```

## Capgo-Specific Guardrails

- Call `CapacitorUpdater.notifyAppReady()` after app bootstrap.
- Separate native release notes from web update notes.
- Use staged channels before production.
- Keep a known-good bundle available for rollback.

## Done Criteria

- Implementation handles unavailable plugins safely.
- Config is production-safe.
- Tests and verification commands are listed or executed.
- Rollout plan and rollback plan are explicit.
