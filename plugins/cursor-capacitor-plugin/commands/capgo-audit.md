---
name: capgo-audit
description: Perform a full Capacitor + Capgo project audit for architecture, security, testing, and release readiness.
---

# Capgo Audit

Run a complete audit on the current project.

## Steps

1. Map all Capacitor and Capgo dependencies and versions.
2. Inspect `capacitor.config.ts` for production safety and Capgo config quality.
3. Check for incorrect tooling usage (`npm`/`npx`) and convert to `bun`/`bunx` equivalents.
4. Verify that native plugin changes are followed by `bunx cap sync`.
5. Evaluate security posture (secrets handling, transport security, debug flags).
6. Evaluate test coverage and validation commands for touched flows.
7. Produce a release risk report with blockers, recommended fixes, and deployment sequence.
