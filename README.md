# Capgo Cursor Plugin Pack

Cursor plugin repository for Capgo, focused on Capacitor best practices and safe Capgo rollout workflows.

## Plugin

- `capgo-capacitor-trojan`: Capgo + Capacitor guardrails for architecture, security, testing, and release operations.

## Local validation

```bash
bun scripts/validate-template.mjs
```

## Publish flow

1. Push this repository to a public GitHub repository under the Capgo organization.
2. Keep the plugin metadata in `.cursor-plugin/marketplace.json` and `plugins/capgo-capacitor-trojan/.cursor-plugin/plugin.json` up to date.
3. Submit the repository link to Cursor Marketplace review.
