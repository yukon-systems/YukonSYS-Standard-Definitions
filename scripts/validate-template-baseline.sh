#!/usr/bin/env bash
set -euo pipefail

fail=0

require_path() {
  local path=$1
  if [[ ! -e "$path" ]]; then
    printf 'missing required baseline path: %s\n' "$path" >&2
    fail=1
  fi
}

required_paths=(
  AGENTS.md
  README.md
  SECURITY.md
  .gitattributes
  .gitignore
  .github/ISSUE_TEMPLATE/bug.yml
  .github/ISSUE_TEMPLATE/task.yml
  .github/ISSUE_TEMPLATE/change_request.yml
  .github/ISSUE_TEMPLATE/incident.yml
  .github/ISSUE_TEMPLATE/problem.yml
  .github/ISSUE_TEMPLATE/service_request.yml
  .github/ISSUE_TEMPLATE/security_finding.yml
  .github/ISSUE_TEMPLATE/hardware_fault.yml
  .github/ISSUE_TEMPLATE/rfc_design_proposal.yml
  .github/PULL_REQUEST_TEMPLATE/generic-change.md
  .github/PULL_REQUEST_TEMPLATE/code-change.md
  .github/PULL_REQUEST_TEMPLATE/infrastructure-change.md
  .github/PULL_REQUEST_TEMPLATE/infrastructure-reconciliation.md
  .github/PULL_REQUEST_TEMPLATE/operational-documentation.md
  .github/PULL_REQUEST_TEMPLATE/automation-tooling.md
  .github/PULL_REQUEST_TEMPLATE/dependency-upgrade.md
  .github/PULL_REQUEST_TEMPLATE/security-sensitive-change.md
  .github/PULL_REQUEST_TEMPLATE/emergency-change.md
  .structs/agentsys/AGENT_AUGMENTS.md
  .structs/agentsys/AGENT_RULES.md
  .structs/opersys/git/github-templates-compliance.md
  .structs/opersys/git/repository-template-policy.md
  .structs/opersys/git/labels/core-labels.md
  .structs/opersys/git/conventional-commits/standard.md
  .structs/specsys/README.SPEC.md
  .structs/specsys/SEMVER.SPEC.md
)

for path in "${required_paths[@]}"; do
  require_path "$path"
done

stale_refs=$(git grep -nE '(^|[^.[:alnum:]_])structs/' -- '*.md' '*.yml' '*.yaml' 2>/dev/null || true)
if [[ -n "$stale_refs" ]]; then
  printf 'stale non-hidden structs/ path references found; use .structs/:\n%s\n' "$stale_refs" >&2
  fail=1
fi

if ! gh api repos/yukon-systems/YukonSYS-Standard-Definitions --jq '.is_template' 2>/dev/null | grep -qx 'true'; then
  printf 'warning: could not verify GitHub repository is configured as a template via gh api\n' >&2
fi

exit "$fail"
