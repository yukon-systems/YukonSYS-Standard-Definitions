---
template_id: YS-LANG-VALIDATION-001
template_family: langsys
title: Validation Handling Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - scripts/validate-template-baseline.sh
  - validation scripts
  - quality gates
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - Uploaded github-templates-compliance.md
  - POSIX Shell
  - Bash manual
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

# Validation Handling Standard

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

Define validation script behavior, exit-code discipline, and evidence requirements for repository standards checks.

<a id="when-to-use"></a>
## When to Use

- Writing validators
- Adding CI gates
- Checking templates and standards files

<a id="when-not-to-use"></a>
## When Not to Use

- Do not make validators destructive by default.
- Do not suppress errors to pass CI.
- Do not use validation output to expose secrets.

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
- Validators must be read-only unless explicitly named as fixers.
- Support `--help` and deterministic output.
- Exit 0 for pass, non-zero for failure, and document codes.
- Emit machine-readable output where practical.
- Validate negative fixtures, not just happy paths.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
scripts/validate-template-baseline.sh
scripts/validate-template-baseline.sh --help
shellcheck scripts/validate-template-baseline.sh
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Validator version
- Input files scanned
- Pass/fail counts
- Exit code
- Skipped files and reasons

<a id="validation"></a>
## Validation

- Validator fails on missing required metadata.
- Validator passes on current catalog.
- Exit codes match documentation.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Disable new CI gate.
- Revert validator.
- Restore previous validation rule set.

<a id="references"></a>
## References

- references/github-templates-compliance.md
- https://www.gnu.org/software/bash/manual/bash.html

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
