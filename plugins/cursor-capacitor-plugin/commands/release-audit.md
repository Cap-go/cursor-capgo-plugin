---
name: release-audit
description: Perform a strict Capacitor + Capgo release audit with compatibility gates, operational evidence, and ship/hold decision.
---

# Release Audit

Audit the current repository for live-update release readiness.

## Execution Flow

1. Read dependency versions and config for Capacitor/updater setup.
2. Run local script checks:
   - `./scripts/check-capacitor-compatibility.sh --strict`
3. Collect Capgo CLI evidence (or list missing evidence):
   - `capgo doctor`
   - `capgo bundle compatibility <appId> --channel <targetChannel>`
   - `capgo bundle releaseType <appId> --channel <targetChannel>`
   - `capgo channel currentBundle <targetChannel> <appId>`
4. Validate tests/security evidence for impacted areas.
5. Validate rollback command and known-good target bundle.

## Required Output

- `Status`: pass | pass-with-risk | fail
- `Blocking findings`: highest-severity issues first
- `Operational evidence`: exact command outputs used
- `Rollback command`: copy/paste command with placeholders resolved
- `Decision`: ship | hold
