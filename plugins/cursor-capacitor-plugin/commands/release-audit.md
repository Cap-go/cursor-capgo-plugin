---
name: release-audit
description: Perform a full Capacitor + live-update project audit for architecture, security, testing, and release readiness.
---

# Release Audit

Run a complete audit on the current project.

## Steps

1. Map all Capacitor dependencies and live-update integration points.
2. Inspect `capacitor.config.ts` for production safety and update config quality.
3. Verify that native plugin changes are followed by platform sync.
4. Evaluate security posture (secrets handling, transport security, debug flags).
5. Evaluate test coverage and validation commands for touched flows.
6. Produce a release risk report with blockers, recommended fixes, and deployment sequence.
