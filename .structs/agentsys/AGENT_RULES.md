---
template_id: YS-AGENT-RULES-001
template_family: agentsys
title: Agent Routing and Subject-Matter Rules
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - all-agentic-workers
source_basis:
  - root AGENTS.md
  - references/github-templates-compliance.md
classification: internal
required_fields:
  - purpose
  - routing
  - stop_conditions
  - evidence_required
validation_rules:
  - agents must read the routed subject file before action
  - production-impacting commands require explicit human approval
review_cadence: 90 days
last_reviewed: 2026-06-03
change_control: CCR required for authority or routing changes
---

# Agent Routing and Subject-Matter Rules

<a id="toc"></a>
## Table of Contents

- [Purpose](#purpose)
- [Global Routing Rule](#global-routing-rule)
- [Workflow Routing Matrix](#workflow-routing-matrix)
- [Action Sequence](#action-sequence)
- [Stop Conditions](#stop-conditions)
- [Evidence Required](#evidence-required)
- [Validation](#validation)
- [Rollback or Backout](#rollback-or-backout)
- [References](#references)
- [Version History](#version-history)

<a id="purpose"></a>
## Purpose

Direct agentic workers to the correct standards catalog before they propose, generate, validate, or modify language code, OS procedures, hardware procedures, networking procedures, infrastructure controls, templates, or compliance evidence.

<a id="global-routing-rule"></a>
## Global Routing Rule

Agents must resolve the workflow type before acting:

1. **Language, scripting, SQL, markup, diagrams, RAG, APIs, validation, return codes, or exception handling** -> `.structs/langsys/`.
2. **Operating-system administration or OS-specific operator language** -> `.structs/opersys/`.
3. **Server hardware, board hardware, network appliances, interconnects, BMCs, firmware, serial, or remote-management tooling** -> `.structs/hwsys/`.
4. **Specification definitions, security/compliance controls, evidence schemas, source basis, or baseline validation** -> `.structs/specsys/`.
5. **Agent authority, operating limits, named-agent responsibilities, webhook intake controls, or model-specific behaviors** -> `.structs/agentsys/`.

When a task spans multiple categories, read every applicable file and use the strictest control.

<a id="workflow-routing-matrix"></a>
## Workflow Routing Matrix

| Workflow Type | Required First Read | Additional Reads |
|---|---|---|
| New script or CLI | `.structs/langsys/validation/STANDARD.md` | Shell, Bash, Python, return-code, and exception standards as applicable |
| OS runbook | `.structs/opersys/INDEX.md` | Target OS `AGENTS.md`; relevant hwsys infrastructure file |
| SQL migration/procedure | `.structs/langsys/sql/ansi-sql.md` | Target DB standard and CCR policy |
| Hardware maintenance | `.structs/hwsys/INDEX.md` | Target infrastructure/hardware file and OS serial/BMC file |
| Network appliance change | `.structs/hwsys/networking/` | Security controls and rollback plan |
| RAG data processing | `.structs/langsys/rag-data-processing/STANDARD.md` | API token/header and search API standards |
| Documentation/template change | `.structs/langsys/markup/STANDARD.md` | Specsys evidence and validation files |
| Agent behavior change | `.structs/agentsys/AGENT_AUGMENTS.md` | This file and root AGENTS.md |

<a id="action-sequence"></a>
## Action Sequence

1. Read root `AGENTS.md` and `.structs/agentsys/AGENTS.md`.
2. Read this routing file.
3. Read the applicable subject-matter files.
4. Detect target versions and architecture using read-only commands.
5. Confirm lifecycle stage and production impact.
6. Generate a minimal plan with validation and backout.
7. Execute only authorized changes.
8. Produce evidence and final response in the required AGENTS.md format.

<a id="stop-conditions"></a>
## Stop Conditions

- The target system, architecture, firmware, OS, service manager, database, or appliance version cannot be verified.
- The task implies production change without a change ticket or explicit approval.
- The task requires secrets, tokens, unredacted headers, private keys, or credential material.
- The task would alter ABI/API/CLI/schema/message contracts without a Compatibility Change Record.
- The task changes network routing, firewall policy, BMC access, firmware, bootloader variables, kernel parameters, storage layout, or database schema without rollback evidence.
- The task conflicts with a subject standard or lacks a source basis.

<a id="evidence-required"></a>
## Evidence Required

- Files read and standards applied.
- Version/architecture detection output or an explicit statement that detection was not run.
- Commands proposed or run, with destructive commands clearly labeled.
- Validation results.
- Rollback or backout path.
- Risks, gaps, and required human approvals.

<a id="validation"></a>
## Validation

- Confirm the selected route maps to at least one subject standard.
- Confirm every production-impacting action has human approval, rollback evidence, and an applicable lifecycle stage.
- Confirm agent authority is not expanded by implication.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Restore the previous `.structs/agentsys/AGENT_RULES.md` revision.
- Re-run `scripts/validate-template-baseline.sh`.
- Record routing changes in CCR evidence if worker authority, stop conditions, or required reads changed.

<a id="references"></a>
## References

- root `AGENTS.md`
- `.structs/agentsys/AGENTS.md`
- `references/github-templates-compliance.md`

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial routing layer for expanded standards repository.
