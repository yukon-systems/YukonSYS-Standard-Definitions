---
template_id: YS-LANG-LISP-LUA-001
template_family: langsys
title: Lisp and Lua Agent Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - Common Lisp
  - Scheme-family-lisp
  - Emacs Lisp
  - Lua
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - Common Lisp HyperSpec
  - Lua 5.4 Reference Manual
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

# Lisp and Lua Agent Standard

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

Define standards for dynamic language use where Lisp or Lua is embedded, extended, or used for automation/configuration.

<a id="when-to-use"></a>
## When to Use

- Embedding Lua for configuration or extensions
- Maintaining Lisp macros or DSLs
- Generating dynamic rules while preserving auditability

<a id="when-not-to-use"></a>
## When Not to Use

- Do not run untrusted Lua/Lisp code with filesystem, network, or shell access.
- Do not hide operational behavior inside macros or metaprogramming without generated expansion evidence.

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
- Constrain dynamic evaluation and macro expansion behind reviewed interfaces.
- Document module/package boundaries and exported symbols.
- Version serialized forms and embedded DSL grammars.
- For Lua, define sandboxed environments and explicit library allowlists.
- For Lisp, document macro expansion behavior and side effects.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
lua -v
lua -e "print(_VERSION)"
sbcl --version || clisp --version
grep -R "eval\|loadstring\|dofile\|load " <path>
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Runtime version
- Sandbox policy
- Exported symbol/module list
- Tests for invalid configuration and malformed DSL input

<a id="validation"></a>
## Validation

- Dynamic evaluation callsites are reviewed.
- All embedded scripts have deterministic tests.
- Generated or macro-expanded behavior is inspectable.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Disable plugin/extension.
- Restore previous DSL grammar or module.
- Clear compiled/cache artifacts if applicable.

<a id="references"></a>
## References

- https://www.lispworks.com/documentation/HyperSpec/Front/
- https://www.lua.org/manual/5.4/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
