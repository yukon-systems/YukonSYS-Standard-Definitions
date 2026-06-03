---
template_id: YS-SPEC-COMPLIANCE-TAXONOMY-001
template_family: specsys
title: Compliance Taxonomy and Lifecycle Controls
version: 0.1.0
status: draft
owner_role: governance-risk-compliance
applies_to:
  - critical-resource-management
  - engineering-policy
  - agentic-workflows
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - NIST SP 800-218 SSDF
  - SLSA v1.2
  - SPDX ISO/IEC 5962:2021
  - CycloneDX specification
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

# Compliance Taxonomy and Lifecycle Controls

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

Define stable terms and classification rules for lifecycle gates, compatibility, scope control, evidence, and production safety.

<a id="when-to-use"></a>
## When to Use

- Classifying a change by lifecycle stage
- Determining whether CCR/ADR/DDN/PER evidence is required
- Mapping standards files to audit controls

<a id="when-not-to-use"></a>
## When Not to Use

- Do not use as a substitute for legal, contractual, export-control, or regulated-industry compliance review.

<a id="required-inputs"></a>
## Required Inputs

- Target environment name and lifecycle stage: proof-of-concept, development, testing, burn-in, or production.
- Exact OS, architecture, toolchain, firmware, package, database, or appliance version as applicable.
- Approved issue, ADR, DDN, CCR, runbook, or change ticket.
- Backout owner, maintenance window, test plan, and acceptance criteria for operational changes.
- Redacted configuration values or parameter names. Do not request or echo secrets.

<a id="non-negotiable-agent-rules"></a>
## Non-Negotiable Agent Rules

- Classify every task as POC, development, testing, burn-in, or production before action.
- Treat ABI/API/CLI/schema/message/data/metric/log contracts as compatibility surfaces.
- Breaking changes require CCR, deprecation timeline, migration path, and backout evidence.
- Use NIST SSDF for secure SDLC practice mapping and SLSA for build/provenance practice mapping.
- Use SPDX or CycloneDX for SBOM evidence where software artifacts are produced.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
classify-change --stage <stage> --risk <low|medium|high|critical>
validate-template-baseline.sh
make sbom
make provenance
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Lifecycle stage
- Risk class
- Compatibility impact
- Evidence files
- Validation outputs
- Approval record

<a id="validation"></a>
## Validation

- All standards files contain required metadata.
- All production-impacting changes include rollback/backout.
- All supply-chain changes include SBOM/provenance evidence.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Use last known good release artifact and configuration.
- Preserve old interface until deprecation window expires.
- Record rollback success/failure in PER.

<a id="references"></a>
## References

- https://csrc.nist.gov/pubs/sp/800/218/final
- https://slsa.dev/spec/v1.2/about
- https://spdx.dev/use/specifications/
- https://cyclonedx.org/specification/overview/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
