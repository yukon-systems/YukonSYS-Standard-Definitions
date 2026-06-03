---
template_id: YS-LANG-ORACLE-RAC-SQL-001
template_family: langsys
title: Oracle Database and RAC SQL / Extension Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - Oracle Database
  - Oracle RAC
  - PL/SQL
  - SQL extensions
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - Oracle Database SQL Language Reference
  - Oracle RAC documentation
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

# Oracle Database and RAC SQL / Extension Standard

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

Define Oracle SQL/PLSQL and RAC-aware operational controls for clustered database environments.

<a id="when-to-use"></a>
## When to Use

- Changing PL/SQL packages, procedures, functions, triggers, views, synonyms, grants
- Working with RAC-aware service routing or cluster-sensitive SQL

<a id="when-not-to-use"></a>
## When Not to Use

- Do not change RAC services, Data Guard, ASM, tablespaces, or grants without DBA approval.
- Do not assume single-instance behavior in RAC.

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
- Capture object DDL with DBMS_METADATA or approved export method.
- Document editioning, invalidation, package state, grants, and dependency recompilation.
- Use bind variables and review execution plans.
- Document RAC service, node affinity, transaction, and failover implications.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
sqlplus -V
SELECT * FROM v$version;
SELECT inst_id, instance_name, status FROM gv$instance;
EXPLAIN PLAN FOR <query>;
SELECT dbms_metadata.get_ddl(...) FROM dual;
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- RAC instance/service map
- DDL/object diff
- Plan output
- Invalid object check
- Rollback DDL
- Backup/restore point reference

<a id="validation"></a>
## Validation

- Staging RAC test or approved equivalent.
- No unexpected invalid objects.
- Service routing and failover behavior unchanged unless approved.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Restore previous object DDL.
- Use guaranteed restore point if approved.
- Move service back to previous instance/application path.

<a id="references"></a>
## References

- https://docs.oracle.com/en/database/oracle/oracle-database/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
