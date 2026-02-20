---
name: capgo-compatibility-checker
description: Run multi-layer compatibility checks for Capacitor and Capgo updates before channel promotion.
---

# Capgo Compatibility Checker

Use this skill when validating whether a bundle is safe to ship to a target channel.

## Compatibility Layers

1. Package compatibility
- Capacitor core package major alignment
- updater package presence

2. Runtime compatibility
- `CapacitorUpdater` config present
- `notifyAppReady()` call path present on startup

3. Channel compatibility
- `npx @capgo/cli@latest bundle compatibility` pass against target channel
- `npx @capgo/cli@latest bundle releaseType` returns OTA when expected

4. Rollout compatibility
- Previous stable bundle available for rollback
- channel state and targeting validated before promotion

## Commands

```bash
./scripts/check-capacitor-compatibility.sh --strict
npx @capgo/cli@latest bundle compatibility <appId> --channel <targetChannel>
npx @capgo/cli@latest bundle releaseType <appId> --channel <targetChannel>
npx @capgo/cli@latest channel currentBundle <targetChannel> <appId>
npx @capgo/cli@latest bundle list <appId>
```

## Decision Matrix

- `all green`: proceed
- `local fail`: fix repository compatibility before any upload
- `channel compatibility fail`: stop promotion, investigate metadata/package mismatch
- `release type = native`: schedule store release, do not OTA

## Required Output

- `Gate results`: pass/fail per layer
- `Blocking issues`: exact mismatch or missing config
- `Remediation commands`: concrete next steps
- `Final decision`: promote | hold
