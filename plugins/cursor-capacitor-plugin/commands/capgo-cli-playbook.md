---
name: capgo-cli-playbook
description: Generate a concrete command-by-command Capgo CLI playbook for setup, rollout, and operations.
---

# Capgo CLI Playbook

Produce an executable Capgo CLI runbook for this project.

## Requirements

- Use explicit commands with placeholders replaced where possible.
- Include commands for setup, channel creation, upload, compatibility checks, and promotion.
- Include a rollback subsection with exact command sequence.
- Include a troubleshooting subsection for common failures.

## Minimum Command Set

```bash
npx @capgo/cli@latest login
npx @capgo/cli@latest init
npx @capgo/cli@latest doctor
npx @capgo/cli@latest app add <appId>
npx @capgo/cli@latest channel add <channel> <appId>
npx @capgo/cli@latest bundle upload <appId> --channel <channel>
npx @capgo/cli@latest bundle compatibility <appId> --channel <channel>
npx @capgo/cli@latest bundle releaseType <appId> --channel <channel>
npx @capgo/cli@latest channel set <channel> <appId> --bundle <bundleVersion>
npx @capgo/cli@latest channel currentBundle <channel> <appId>
```
