#!/usr/bin/env bash
set -euo pipefail

echo "[capgo-capacitor-trojan] Session checklist:"
echo "- Verify bun/bunx commands were used"
echo "- Verify bunx cap sync after native dependency changes"
echo "- Verify release-impact notes separate web and native changes"
