---
template_id: YS-LANG-RETURN-CODES-EXCEPTIONS-001
template_family: langsys
title: POSIX Return Codes and General Exception Handler Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - return codes
  - exit status
  - exception handling
  - error contracts
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - POSIX
  - Bash manual
  - language runtime manuals
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

# POSIX Return Codes and General Exception Handler Standard

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

Define normalized process exit codes and exception-handling expectations for scripts, services, CLIs, and workflows.

<a id="when-to-use"></a>
## When to Use

- Designing command-line tools
- Wrapping operational commands
- Defining error handling across languages

<a id="when-not-to-use"></a>
## When Not to Use

- Do not collapse all errors to `1` when callers need to distinguish retryable, configuration, validation, permission, and dependency failures.
- Do not catch broad exceptions without logging context and re-raising or returning a documented failure.

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
- Document exit-code map in every CLI/script.
- Use 0 for success.
- Treat 2 as command-line/config usage error unless a tool defines otherwise.
- Reserve 64-78 for sysexits-style categories where adopted.
- Use exceptions for exceptional conditions, not normal control flow.
- Map exceptions to stable error codes at process boundaries.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
echo $?
false; printf "%s\n" "$?"
python -m pytest tests/test_errors.py
grep -R "except Exception\|catch (...)\|rescue StandardError" src scripts
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Exit-code table
- Exception taxonomy
- Test coverage for expected failures
- Log redaction evidence

<a id="validation"></a>
## Validation

- All documented errors have tests.
- Unhandled exceptions fail closed.
- Sensitive context is redacted.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Restore previous error contract only with compatibility review.
- Keep old code aliases during deprecation window.

<a id="references"></a>
## References

- https://pubs.opengroup.org/onlinepubs/9799919799/
- https://www.gnu.org/software/bash/manual/bash.html

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
