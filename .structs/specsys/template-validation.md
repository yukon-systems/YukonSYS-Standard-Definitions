---
template_id: YS-SPEC-TEMPLATE-VALIDATION-001
template_family: specsys
title: Template Baseline Validation Standard
version: 0.1.0
status: draft
owner_role: documentation-architecture
applies_to:
  - .structs/**/*.md
  - scripts/validate-template-baseline.sh
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - Uploaded github-templates-compliance.md
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

# Template Baseline Validation Standard

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

Define required metadata and sections for every standards file so the catalog remains machine-indexable and auditable.

<a id="when-to-use"></a>
## When to Use

- Creating new standards files
- Reviewing catalog consistency
- Adding validation gates to CI

<a id="when-not-to-use"></a>
## When Not to Use

- Do not approve standards files without metadata, source basis, evidence, validation, and rollback sections.

<a id="required-inputs"></a>
## Required Inputs

- Target environment name and lifecycle stage: proof-of-concept, development, testing, burn-in, or production.
- Exact OS, architecture, toolchain, firmware, package, database, or appliance version as applicable.
- Approved issue, ADR, DDN, CCR, runbook, or change ticket.
- Backout owner, maintenance window, test plan, and acceptance criteria for operational changes.
- Redacted configuration values or parameter names. Do not request or echo secrets.

<a id="non-negotiable-agent-rules"></a>
## Non-Negotiable Agent Rules

- Every standard must include YAML metadata.
- Every standard must include Purpose, Evidence Required, Validation, Rollback or Backout, References, and Version History.
- Indexes may use a reduced format but must include purpose and file map.
- Generated placeholders must be labeled as placeholders.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
scripts/validate-template-baseline.sh
find .structs -name "*.md" -print
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Validator output
- List of skipped files and reason
- Changed file list

<a id="validation"></a>
## Validation

- Validator passes or documented exceptions are approved.
- No missing source_basis fields in standards files.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Restore previous standards file.
- Open CCR for any schema change.

<a id="references"></a>
## References

- references/github-templates-compliance.md

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
