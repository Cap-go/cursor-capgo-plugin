#!/usr/bin/env bash
set -euo pipefail

STRICT=0
QUIET=0

for arg in "$@"; do
  case "$arg" in
    --strict)
      STRICT=1
      ;;
    --quiet)
      QUIET=1
      ;;
  esac
done

ROOT_DIR="${PWD}"
if [ ! -f "${ROOT_DIR}/package.json" ]; then
  if [ "$QUIET" -eq 0 ]; then
    echo "[compatibility] package.json not found in ${ROOT_DIR}; skipping local checks."
  fi
  exit 0
fi

node - "$ROOT_DIR" "$STRICT" "$QUIET" <<'NODE'
const fs = require('fs');
const path = require('path');

const rootDir = process.argv[2];
const strict = process.argv[3] === '1';
const quiet = process.argv[4] === '1';

const issues = [];
const warnings = [];
const notes = [];

const readJson = (filePath) => {
  try {
    return JSON.parse(fs.readFileSync(filePath, 'utf8'));
  } catch {
    return null;
  }
};

const packageJson = readJson(path.join(rootDir, 'package.json'));
if (!packageJson) {
  console.log('[compatibility] Unable to read package.json');
  process.exit(strict ? 1 : 0);
}

const deps = {
  ...(packageJson.dependencies || {}),
  ...(packageJson.devDependencies || {}),
  ...(packageJson.peerDependencies || {}),
};

const depVersion = (name) => deps[name] || null;
const majorFrom = (version) => {
  if (!version) return null;
  const match = String(version).match(/(\d+)\./) || String(version).match(/(\d+)/);
  return match ? Number(match[1]) : null;
};

const capCore = depVersion('@capacitor/core');
const capCli = depVersion('@capacitor/cli');
const capAndroid = depVersion('@capacitor/android');
const capIos = depVersion('@capacitor/ios');
const updater = depVersion('@capgo/capacitor-updater');

if (!capCore) issues.push('Missing @capacitor/core dependency.');
if (!capCli) warnings.push('Missing @capacitor/cli dependency.');
if (!capAndroid) warnings.push('Missing @capacitor/android dependency.');
if (!capIos) warnings.push('Missing @capacitor/ios dependency.');
if (!updater) warnings.push('Missing @capgo/capacitor-updater dependency (required for Capgo OTA workflows).');

const majors = [capCore, capCli, capAndroid, capIos]
  .filter(Boolean)
  .map(majorFrom)
  .filter((v) => Number.isFinite(v));

if (majors.length > 1) {
  const unique = [...new Set(majors)];
  if (unique.length > 1) {
    issues.push('Capacitor package major versions are misaligned. Keep core/cli/android/ios on same major.');
  }
}

const configCandidates = [
  'capacitor.config.ts',
  'capacitor.config.js',
  'capacitor.config.mjs',
  'capacitor.config.cjs',
  'capacitor.config.json',
].map((file) => path.join(rootDir, file));

const existingConfigs = configCandidates.filter((file) => fs.existsSync(file));
if (existingConfigs.length === 0) {
  issues.push('No capacitor.config.* file found.');
}

const configContent = existingConfigs
  .map((file) => {
    try {
      return fs.readFileSync(file, 'utf8');
    } catch {
      return '';
    }
  })
  .join('\n');

if (updater && !/CapacitorUpdater/.test(configContent)) {
  warnings.push('Updater dependency present but CapacitorUpdater config block not found.');
}
if (/cleartext\s*:\s*true/.test(configContent)) {
  issues.push('Potential production risk: cleartext: true found in capacitor config.');
}

const searchRoots = ['src', 'app', 'apps', 'packages']
  .map((p) => path.join(rootDir, p))
  .filter((p) => fs.existsSync(p));

const ignoredDirs = new Set(['node_modules', '.git', 'ios', 'android', 'dist', 'build']);
const sourceExt = new Set(['.ts', '.tsx', '.js', '.jsx', '.vue', '.svelte']);
let foundNotify = false;

const walk = (dir) => {
  const entries = fs.readdirSync(dir, { withFileTypes: true });
  for (const entry of entries) {
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      if (ignoredDirs.has(entry.name)) continue;
      walk(full);
      if (foundNotify) return;
      continue;
    }
    if (!sourceExt.has(path.extname(entry.name))) continue;
    const content = fs.readFileSync(full, 'utf8');
    if (/CapacitorUpdater\s*\.\s*notifyAppReady\s*\(/.test(content)) {
      foundNotify = true;
      return;
    }
  }
};

for (const folder of searchRoots) {
  walk(folder);
  if (foundNotify) break;
}

if (updater && !foundNotify) {
  warnings.push('CapacitorUpdater.notifyAppReady() not found in app source folders.');
}

notes.push(`Capacitor core: ${capCore || 'missing'}`);
notes.push(`Capacitor cli: ${capCli || 'missing'}`);
notes.push(`Capacitor android: ${capAndroid || 'missing'}`);
notes.push(`Capacitor ios: ${capIos || 'missing'}`);
notes.push(`Capgo updater: ${updater || 'missing'}`);

if (!quiet) {
  console.log('[compatibility] Local project check');
  for (const note of notes) console.log(`- ${note}`);
  if (issues.length === 0 && warnings.length === 0) {
    console.log('[compatibility] PASS: no blockers detected.');
  }
  if (issues.length > 0) {
    console.log('[compatibility] BLOCKERS:');
    for (const issue of issues) console.log(`- ${issue}`);
  }
  if (warnings.length > 0) {
    console.log('[compatibility] WARNINGS:');
    for (const warning of warnings) console.log(`- ${warning}`);
  }
}

if (issues.length > 0 && strict) {
  process.exit(1);
}
NODE
