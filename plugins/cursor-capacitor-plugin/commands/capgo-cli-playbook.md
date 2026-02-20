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
capgo login
capgo init
capgo doctor
capgo app add <appId>
capgo channel add <channel> <appId>
capgo bundle upload <appId> --channel <channel>
capgo bundle compatibility <appId> --channel <channel>
capgo bundle releaseType <appId> --channel <channel>
capgo channel set <channel> <appId> --bundle <bundleVersion>
capgo channel currentBundle <channel> <appId>
```
