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
npx @capgo/cli@latest login
npx @capgo/cli@latest init
npx @capgo/cli@latest doctor
```

### Bundle operations

```bash
npx @capgo/cli@latest bundle zip <appId> --path <webBuildPath>
npx @capgo/cli@latest bundle upload <appId> --path <webBuildPath> --channel <channel>
npx @capgo/cli@latest bundle compatibility <appId> --channel <channel>
npx @capgo/cli@latest bundle releaseType <appId> --channel <channel>
npx @capgo/cli@latest bundle list <appId>
npx @capgo/cli@latest bundle cleanup <appId> --keep <count>
npx @capgo/cli@latest bundle delete <bundleVersion> <appId>
npx @capgo/cli@latest bundle encrypt <zipFile> <checksum>
npx @capgo/cli@latest bundle decrypt <encryptedZipFile> <checksum>
```

### App management

```bash
npx @capgo/cli@latest app add <appId>
npx @capgo/cli@latest app list
npx @capgo/cli@latest app set <appId> --name <name>
npx @capgo/cli@latest app setting plugins.CapacitorUpdater.defaultChannel --string "production"
npx @capgo/cli@latest app debug <appId>
npx @capgo/cli@latest app delete <appId>
```

### Channel management

```bash
npx @capgo/cli@latest channel add <channel> <appId>
npx @capgo/cli@latest channel list <appId>
npx @capgo/cli@latest channel currentBundle <channel> <appId>
npx @capgo/cli@latest channel set <channel> <appId> --bundle <bundleVersion>
npx @capgo/cli@latest channel set <channel> <appId> --disable-auto-update patch
npx @capgo/cli@latest channel delete <channel> <appId>
```

### Key and encryption management

```bash
npx @capgo/cli@latest key create
npx @capgo/cli@latest key save
npx @capgo/cli@latest key delete_old
```

### Account and organization management

```bash
npx @capgo/cli@latest account id
npx @capgo/cli@latest organization list
npx @capgo/cli@latest organization add --name <orgName> --email <adminEmail>
npx @capgo/cli@latest organization members <orgId>
npx @capgo/cli@latest organization set <orgId> --enforce-2fa
npx @capgo/cli@latest organization delete <orgId>
```

### Cloud build and credentials

```bash
npx @capgo/cli@latest build credentials
npx @capgo/cli@latest build request <appId> --platform ios --path .
npx @capgo/cli@latest build request <appId> --platform android --path .
```

### MCP server

```bash
npx @capgo/cli@latest mcp
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
