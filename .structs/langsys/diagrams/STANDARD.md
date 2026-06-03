---
template_id: YS-LANG-DIAGRAMS-001
template_family: langsys
title: PlantUML and Mermaid Diagram Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - PlantUML
  - Mermaid
  - architecture diagrams
  - sequence diagrams
  - state diagrams
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - PlantUML documentation
  - Mermaid documentation
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

# PlantUML and Mermaid Diagram Standard

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

Define safe, reproducible, text-based diagram handling for engineering design, operations, and audit documentation.

<a id="when-to-use"></a>
## When to Use

- Creating architecture diagrams
- Adding sequence/state/data-flow diagrams
- Generating diagrams in CI

<a id="when-not-to-use"></a>
## When Not to Use

- Do not include secrets, production IPs, private topology, or live incident details in public diagrams.
- Do not rely on diagrams without source text in the repository.

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
- Store diagram source as text.
- Use deterministic rendering in CI.
- Define trust boundaries, data flows, and failure paths for operational diagrams.
- Use stable IDs and captions for references.
- Mark sensitive diagrams with classification.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
plantuml -version
mmdc --version
grep -R "@startuml\|graph TD\|sequenceDiagram" docs .structs
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Diagram source
- Rendered artifact if required
- Tool version
- Classification marking
- Review of trust boundaries

<a id="validation"></a>
## Validation

- Source renders without error.
- Sensitive details redacted.
- Diagram matches referenced design/control.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Restore previous diagram source.
- Remove rendered artifact from release.
- Re-link docs to last approved diagram.

<a id="references"></a>
## References

- https://plantuml.com/guide
- https://plantuml.com/
- https://mermaid.js.org/intro/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
