---
template_id: YS-LANG-POSIX-SHELL-001
template_family: langsys
title: POSIX Shell and Legacy Shell Agent Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - sh
  - ksh
  - csh
  - tcsh
  - portable-shell-scripts
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - The Open Group POSIX Shell and Utilities
  - Bash manual POSIX compatibility notes
  - Debian Reference shell examples
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

# POSIX Shell and Legacy Shell Agent Standard

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

Define safe, portable shell practices for POSIX-compatible scripts and legacy shell environments used by critical operational automation.

<a id="when-to-use"></a>
## When to Use

- Writing portable `/bin/sh` scripts
- Reviewing scripts intended for multiple Unix-like systems
- Maintaining legacy ksh/csh/tcsh scripts with minimal change

<a id="when-not-to-use"></a>
## When Not to Use

- Do not use csh/tcsh for new automation unless the environment requires legacy compatibility.
- Do not assume Bash features in `/bin/sh`.
- Do not mutate production systems without explicit approval and backout.

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
- Prefer POSIX `sh` for portable automation; use Bash only when Bash-specific behavior is documented.
- Use `set -eu` cautiously and document traps/cleanup; avoid hidden failures in pipelines.
- Quote expansions, validate positional parameters, and use `mktemp` for temporary files.
- Return 0 for success and non-zero for failure; reserve custom exit codes in the script header.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
sh -n <script>
shellcheck -s sh <script>
printf "%s\n" "$PATH"
command -v <tool>
uname -s && uname -m
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Shell dialect declaration
- Static syntax check
- ShellCheck or documented equivalent
- Test matrix across target OS/shells
- Exit-code map

<a id="validation"></a>
## Validation

- Script passes `sh -n`.
- All variable inputs are parameterized.
- Failure paths return documented non-zero codes.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Restore previous script.
- Disable scheduled invocation.
- Re-run read-only validation with old parameters.

<a id="references"></a>
## References

- https://pubs.opengroup.org/onlinepubs/9799919799/
- https://www.gnu.org/software/bash/manual/bash.html
- https://www.debian.org/doc/manuals/debian-reference/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
