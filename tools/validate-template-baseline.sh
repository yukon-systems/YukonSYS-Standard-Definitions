#!/usr/bin/env sh
set -eu

ROOT_DIR=${1:-.}
fail=0

require_path() {
  if [ ! -e "$ROOT_DIR/$1" ]; then
    printf 'MISSING: %s\n' "$1" >&2
    fail=1
  fi
}

require_executable() {
  if [ ! -x "$ROOT_DIR/$1" ]; then
    printf 'NOT_EXECUTABLE: %s\n' "$1" >&2
    fail=1
  fi
}

# Appendix A directories.
for path in \
  AGENTS.md README.md docs docs/adr docs/ddn docs/ccr docs/per docs/runbooks \
  config config/schemas config/examples templates src tests tests/unit tests/integration \
  tests/contract tests/compatibility tests/performance ci release release/sbom \
  release/provenance release/records tools; do
  require_path "$path"
done

# Section 13 evidence and templates.
for path in \
  docs/evidence-index.md docs/evidence-index.yaml \
  docs/adr/ADR-TEMPLATE.md docs/ddn/DDN-TEMPLATE.md docs/ccr/CCR-TEMPLATE.md \
  docs/per/PER-TEMPLATE.md release/records/RELEASE-RECORD-TEMPLATE.md \
  docs/exceptions/EXCEPTION-TEMPLATE.md templates/ADR.md templates/DDN.md \
  templates/CCR.md templates/PER.md templates/Release_Record.md \
  templates/Exception_Record.md templates/Evidence_Index.md; do
  require_path "$path"
done

# GitHub intake templates.
for path in \
  .github/ISSUE_TEMPLATE/config.yml .github/ISSUE_TEMPLATE/bug.yml \
  .github/ISSUE_TEMPLATE/change_request.yml .github/ISSUE_TEMPLATE/incident.yml \
  .github/PULL_REQUEST_TEMPLATE/generic-change.md \
  .github/PULL_REQUEST_TEMPLATE/code-change.md \
  .github/PULL_REQUEST_TEMPLATE/security-sensitive-change.md \
  .github/PULL_REQUEST_TEMPLATE/release-pr.md; do
  require_path "$path"
done

# Agent routing files.
for path in \
  .structs/agentsys/AGENTS.md .structs/agentsys/AGENT_RULES.md \
  .structs/agentsys/AGENT_AUGMENTS.md references/REFERENCE_INDEX.md; do
  require_path "$path"
done

# Required heading checks for core templates.
for file in \
  docs/adr/ADR-TEMPLATE.md docs/ddn/DDN-TEMPLATE.md docs/ccr/CCR-TEMPLATE.md \
  docs/per/PER-TEMPLATE.md release/records/RELEASE-RECORD-TEMPLATE.md \
  docs/exceptions/EXCEPTION-TEMPLATE.md; do
  if [ -f "$ROOT_DIR/$file" ]; then
    if ! grep -q '^template_id:' "$ROOT_DIR/$file" && ! grep -q '^---' "$ROOT_DIR/$file"; then
      printf 'MISSING_METADATA: %s\n' "$file" >&2
      fail=1
    fi
    if ! grep -q '## Table of Contents' "$ROOT_DIR/$file"; then
      printf 'MISSING_TOC: %s\n' "$file" >&2
      fail=1
    fi
  fi
done

# Required tools.
require_executable scripts/validate-template-baseline.sh
require_path tools/validate-evidence-index.py

if [ "$fail" -ne 0 ]; then
  printf 'FAIL template baseline validation\n' >&2
  exit 1
fi
printf 'PASS template baseline validation\n'
