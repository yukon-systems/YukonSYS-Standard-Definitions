---
template_id: YS-LANG-POSTGRES-SQL-001
template_family: langsys
title: PostgreSQL SQL / Extension Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - PostgreSQL
  - PL/pgSQL
  - extensions
  - functions
  - procedures
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - PostgreSQL Documentation
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

# PostgreSQL SQL / Extension Standard

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

Define PostgreSQL SQL, extension, function, procedure, and migration controls.

<a id="when-to-use"></a>
## When to Use

- Creating functions/procedures
- Changing extensions
- Changing indexes, constraints, views, triggers, or schemas

<a id="when-not-to-use"></a>
## When Not to Use

- Do not change `shared_preload_libraries`, replication, logical decoding, or extension versions without DBA approval.
- Do not use unsafe dynamic SQL in PL/pgSQL.

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
- Declare function volatility, leakproof/security-definer behavior, search_path, and permissions.
- Use `CREATE EXTENSION` only with version and environment policy.
- Review locks for DDL and use concurrent options where safe.
- Capture `pg_get_functiondef` and schema diffs.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
psql --version
SELECT version();
SELECT extname, extversion FROM pg_extension;
SELECT pg_get_functiondef(<oid>);
EXPLAIN (ANALYZE, BUFFERS) <query>;
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Version/extension inventory
- DDL diff
- Function definition
- Lock/impact analysis
- Rollback SQL
- Backup/snapshot reference

<a id="validation"></a>
## Validation

- Migration tested in staging.
- Lock time and query plan are within approved limits.
- Rollback is executable.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Run down migration.
- Restore previous function/view/index definition.
- Restore database snapshot if needed.

<a id="references"></a>
## References

- https://www.postgresql.org/docs/current/sql-createfunction.html
- https://www.postgresql.org/docs/current/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
