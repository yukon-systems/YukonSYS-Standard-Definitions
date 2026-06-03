---
template_id: YS-LANG-UNIX-TEXT-TOOLS-001
template_family: langsys
title: curl, wget, awk, and sed Scripting Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - curl
  - wget
  - awk
  - sed
  - text-processing-pipelines
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - curl documentation
  - GNU Wget manual
  - GNU Awk manual
  - GNU sed manual
  - Debian Reference text tools
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

# curl, wget, awk, and sed Scripting Standard

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

Define safe command-line data retrieval and text-processing controls for operational scripts.

<a id="when-to-use"></a>
## When to Use

- Writing text-processing scripts
- Downloading controlled inputs
- Transforming logs/configs/templates

<a id="when-not-to-use"></a>
## When Not to Use

- Do not parse security-critical formats with brittle regex when a typed parser exists.
- Do not use `curl -k`/`wget --no-check-certificate` in production.
- Do not use in-place `sed -i` without backup strategy.

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
- Use `curl -fsS --retry` with timeouts and explicit output paths.
- Validate checksums for downloaded artifacts.
- Pin locale where text parsing depends on collation/character classes.
- Prefer `awk` for structured field processing and `sed` for simple stream edits.
- Test pipelines with empty, malformed, large, and unicode inputs.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
curl --version
wget --version
awk --version || awk -W version
sed --version || sed -V
LC_ALL=C <pipeline>
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Tool versions
- Input fixtures
- Output golden files
- Checksum verification
- Failure-mode tests

<a id="validation"></a>
## Validation

- Pipelines fail closed.
- No TLS bypass in production.
- All text transformations have before/after fixtures.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Restore backup file.
- Re-run transformation from original input.
- Disable download/processing job.

<a id="references"></a>
## References

- https://curl.se/docs/
- https://www.gnu.org/software/wget/manual/
- https://www.gnu.org/software/gawk/manual/
- https://www.gnu.org/software/sed/manual/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
