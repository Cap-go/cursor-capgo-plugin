---
name: capgo-cicd-live-updates
description: Design CI/CD pipelines for Capgo bundle delivery with compatibility, security, and rollback gates.
---

# Capgo CI/CD Live Updates

Use this skill when creating or reviewing CI pipelines that publish live updates.

## Pipeline Stages

1. Build web assets.
2. Run lint, tests, and security scan.
3. Run local compatibility checks.
4. Upload to staging channel.
5. Validate staging behavior.
6. Promote to production with approval gate.
7. Execute post-deploy monitoring window.

## Required Gate Commands

```bash
capgo doctor
./scripts/check-capacitor-compatibility.sh --strict
capgo bundle compatibility <appId> --channel <targetChannel>
capgo bundle releaseType <appId> --channel <targetChannel>
```

## Production Promotion Requirements

- Explicit approval with rollback owner.
- Previous production bundle captured.
- Monitoring window and stop conditions defined.

## Failure Policy

- Any failed compatibility gate blocks promotion.
- Any native release-type result blocks OTA path.
- Any missing rollback target blocks production promotion.
