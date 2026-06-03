---
template_id: YS-LANG-ANSI-SQL-001
template_family: langsys
title: ANSI/ISO SQL Standard Profile
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - SQL
  - ANSI SQL
  - ISO/IEC 9075
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - ISO/IEC 9075 SQL
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

# ANSI/ISO SQL Standard Profile

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

Define vendor-neutral SQL expectations before applying database-specific dialect features.

<a id="when-to-use"></a>
## When to Use

- Designing portable queries
- Reviewing SQL that crosses MySQL, Oracle, PostgreSQL, or analytical systems
- Separating standard SQL from vendor extensions

<a id="when-not-to-use"></a>
## When Not to Use

- Do not claim portability unless tested on all target database engines.
- Do not use vendor-specific extensions without marking them.

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
- Treat schemas, stored procedures, extensions, functions, grants, and replication/RAC/cluster behavior as compatibility surfaces.
- Use explicit transactions where supported and document transactional boundaries.
- Never run DDL/DML against production without backup, rollback, lock/impact analysis, and change approval.
- Version migrations and verify downgrade/backout feasibility.
- Do not interpolate SQL from strings; use parameters/bind variables for application calls.
- Prefer standard constructs when they meet requirements.
- Document every vendor extension and fallback.
- Specify isolation level, locking assumptions, collation, timezone, and null semantics.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
SELECT version-specific-detection;
EXPLAIN <query>;
BEGIN; ROLLBACK;
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Dialect matrix
- Query plan evidence
- Test fixtures
- Migration/backout plan

<a id="validation"></a>
## Validation

- Queries pass on every declared target engine or are marked engine-specific.
- Extensions are isolated.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Rollback migration.
- Restore backup/snapshot.
- Revoke feature flag or route traffic to previous DB path.

<a id="references"></a>
## References

- https://www.iso.org/standard/76583.html
- https://jtc1info.org/sd-2-history/jtc1-subcommittees/sc32/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
