---
template_id: YS-LANG-BASH-5-001
template_family: langsys
title: Bash Shell >=5.x Agent Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - bash
  - bash-5.x
  - operational-scripts
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - GNU Bash Reference Manual
classification: internal
required_fields:
  - purpose
  - required_inputs
  - procedure
  - evidence_required
  - validation
  - rollback_or_backout
optional_fields:
  - examples
  - vendor_notes
  - release_notes
validation_rules:
  - no hardcoded variable data
  - source references required for commands and operating assumptions
  - environment, version, and architecture must be detected before changes
related_templates:
  - .structs/agentsys/AGENT_RULES.md
  - .structs/specsys/compliance-taxonomy.md
review_cadence: 180 days
last_reviewed: 2026-06-03
change_control: CCR required for normative or production-impacting changes
---

# Bash Shell >=5.x Agent Standard

<a id="toc"></a>
## Table of Contents

- [Purpose](#purpose)
- [When to Use](#when-to-use)
- [When Not to Use](#when-not-to-use)
- [Required Inputs](#required-inputs)
- [Non-Negotiable Agent Rules](#non-negotiable-agent-rules)
- [Command or Interface Surface](#command-or-interface-surface)
- [Evidence Required](#evidence-required)
- [Validation](#validation)
- [Rollback or Backout](#rollback-or-backout)
- [References](#references)
- [Version History](#version-history)

<a id="purpose"></a>
## Purpose

Define Bash-specific scripting controls for automation where Bash version 5.x or later is explicitly available and pinned.

<a id="when-to-use"></a>
## When to Use

- Using arrays, associative arrays, `[[ ]]`, process substitution, Bash traps, or Bash-specific parameter expansion
- Writing test harnesses or validation scripts tied to Bash >=5.x

<a id="when-not-to-use"></a>
## When Not to Use

- Do not use Bashisms in scripts declared as POSIX `/bin/sh`.
- Do not source untrusted files.
- Do not use `eval` unless a security review approves it.

<a id="required-inputs"></a>
## Required Inputs

- Target environment name and lifecycle stage: proof-of-concept, development, testing, burn-in, or production.
- Exact OS, architecture, toolchain, firmware, package, database, or appliance version as applicable.
- Approved issue, ADR, DDN, CCR, runbook, or change ticket.
- Backout owner, maintenance window, test plan, and acceptance criteria for operational changes.
- Redacted configuration values or parameter names. Do not request or echo secrets.

<a id="non-negotiable-agent-rules"></a>
## Non-Negotiable Agent Rules

- Parameterize variable data through CLI arguments, config files, environment-variable schema, or secret/config services; never hardcode environment-specific values.
- Use deterministic inputs and outputs for tests and examples.
- Pin toolchain and runtime versions for reproducible work.
- Document public interfaces, failure modes, return codes, and security assumptions.
- Maintain backward-compatible command and data contracts unless a CCR authorizes a breaking change.
- Declare `#!/usr/bin/env bash` or absolute interpreter path per repository policy.
- Require `bash --version` evidence for version-dependent behavior.
- Use `set -Eeuo pipefail` only with explicit handling for expected unset values and pipeline failures.
- Use arrays for argument lists; do not build commands by string concatenation.
- Trap cleanup for temporary files and locks.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
bash --version
bash -n <script>
shellcheck -s bash <script>
bats <tests-dir>
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Bash version output
- Syntax check
- Static-analysis output
- Unit/integration test output
- Argument and config examples

<a id="validation"></a>
## Validation

- Bash >=5.x confirmed.
- All commands use arrays or safely quoted arguments.
- Expected non-zero returns are handled.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Revert script version.
- Disable cron/systemd/OpenRC job using approved OS procedure.
- Restore previous config file from version control.

<a id="references"></a>
## References

- https://www.gnu.org/software/bash/manual/bash.html

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
