#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

"${SCRIPT_DIR}/check-capacitor-compatibility.sh" --quiet || true

echo "[cursor-capacitor-plugin] Session checklist:"
echo "- Verify web vs native impact is explicitly documented"
echo "- Verify compatibility gates are run before channel promotion"
echo "- Verify rollback bundle and owner are set for production"
echo "- Verify post-deploy monitoring plan is defined"
