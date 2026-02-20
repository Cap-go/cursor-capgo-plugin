---
name: capgo-cli-operator
description: Execute and explain Capgo CLI workflows for setup, bundle operations, channels, compatibility, encryption, organizations, cloud build, and MCP.
---

# Capgo CLI Operator

Use this skill whenever the user asks how to operate Capgo from the CLI.

## Operator Principles

- Always provide copy/paste-ready command sequences.
- Resolve placeholders when app/channel/bundle info is available.
- Include compatibility and release-type gates before promotion.
- Include rollback commands in every production rollout plan.

## Full Command Surface

### Core bootstrap

```bash
capgo login
capgo init
capgo doctor
```

### Bundle operations

```bash
capgo bundle zip <appId> --path <webBuildPath>
capgo bundle upload <appId> --path <webBuildPath> --channel <channel>
capgo bundle compatibility <appId> --channel <channel>
capgo bundle releaseType <appId> --channel <channel>
capgo bundle list <appId>
capgo bundle cleanup <appId> --keep <count>
capgo bundle delete <bundleVersion> <appId>
capgo bundle encrypt <zipFile> <checksum>
capgo bundle decrypt <encryptedZipFile> <checksum>
```

### App management

```bash
capgo app add <appId>
capgo app list
capgo app set <appId> --name <name>
capgo app setting plugins.CapacitorUpdater.defaultChannel --string "production"
capgo app debug <appId>
capgo app delete <appId>
```

### Channel management

```bash
capgo channel add <channel> <appId>
capgo channel list <appId>
capgo channel currentBundle <channel> <appId>
capgo channel set <channel> <appId> --bundle <bundleVersion>
capgo channel set <channel> <appId> --disable-auto-update patch
capgo channel delete <channel> <appId>
```

### Key and encryption management

```bash
capgo key create
capgo key save
capgo key delete_old
```

### Account and organization management

```bash
capgo account id
capgo organization list
capgo organization add --name <orgName> --email <adminEmail>
capgo organization members <orgId>
capgo organization set <orgId> --enforce-2fa
capgo organization delete <orgId>
```

### Cloud build and credentials

```bash
capgo build credentials
capgo build request <appId> --platform ios --path .
capgo build request <appId> --platform android --path .
```

### MCP server

```bash
capgo mcp
```

## Standard Runbooks

### First-time project setup

1. Authenticate and initialize.
2. Register app and channels.
3. Upload first staging bundle.
4. Set bundle explicitly on staging.
5. Verify compatibility before beta/production.

### Safe staged rollout

1. Check current bundle on target channel.
2. Run compatibility and release-type checks.
3. Publish to staging then beta.
4. Promote to production after gate pass.
5. Watch monitoring window and keep rollback ready.

### Emergency rollback

1. Query current production bundle.
2. Select known-good previous bundle.
3. Reassign production channel to known-good bundle.
4. Validate startup and update health.
5. Draft incident summary and fix-forward plan.

## Troubleshooting Patterns

- `doctor` fails: verify config/appId/updater install, then rerun.
- `bundle compatibility` fails: inspect package metadata mismatch and native dependency drift.
- `releaseType` returns native: stop OTA path and schedule store release.
- channel update unexpected: check `channel currentBundle` and channel targeting flags.
- update not applied: verify `notifyAppReady()` path and app debug events.

## Response Requirements

- Include command blocks in execution order.
- Include expected outputs for gate commands.
- Include rollback command in every production plan.
- Flag destructive commands and request confirmation step.
