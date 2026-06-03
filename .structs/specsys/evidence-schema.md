---
template_id: YS-SPEC-EVIDENCE-SCHEMA-001
template_family: specsys
title: Audit Evidence Schema
version: 0.1.0
status: draft
owner_role: governance-risk-compliance
applies_to:
  - all-standards
  - reviews
  - agent-final-response
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - Uploaded github-templates-compliance.md
  - NIST SSDF
  - SLSA provenance concepts
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

# Audit Evidence Schema

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

Define the minimum evidence payload required for standards-compliant changes and agent outputs.

<a id="when-to-use"></a>
## When to Use

- Recording build/test evidence
- Preparing review packets
- Capturing operational command evidence

<a id="when-not-to-use"></a>
## When Not to Use

- Do not use evidence records to store secrets, tokens, private keys, passwords, or raw customer data.

<a id="required-inputs"></a>
## Required Inputs

- Target environment name and lifecycle stage: proof-of-concept, development, testing, burn-in, or production.
- Exact OS, architecture, toolchain, firmware, package, database, or appliance version as applicable.
- Approved issue, ADR, DDN, CCR, runbook, or change ticket.
- Backout owner, maintenance window, test plan, and acceptance criteria for operational changes.
- Redacted configuration values or parameter names. Do not request or echo secrets.

<a id="non-negotiable-agent-rules"></a>
## Non-Negotiable Agent Rules

- Evidence must be reproducible, timestamped, and tied to commit/run identifiers.
- Command output must be redacted before archival.
- Unavailable commands must be listed as not run with reason and risk.
- Every file change must map to purpose, validation, and rollback relevance.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
git rev-parse HEAD
git status --short
make test
make sbom
make provenance
scripts/validate-template-baseline.sh
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Change ID
- Commit or artifact digest
- Environment
- Lifecycle stage
- Commands run
- Pass/fail/not-run status
- Redaction note
- Reviewer or approver

<a id="validation"></a>
## Validation

- Evidence records are complete and redacted.
- Every not-run command includes reason and risk.
- Production evidence includes rollback verification.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Revert evidence record only by appending correction.
- Do not delete failed evidence; supersede with corrected run.

<a id="references"></a>
## References

- https://slsa.dev/spec/v1.2/about
- https://csrc.nist.gov/pubs/sp/800/218/final

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
