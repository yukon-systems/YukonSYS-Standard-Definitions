---
template_id: YS-OS-SOLARIS-SPARC-001
template_family: opersys
title: Solaris 10 + 11 SPARC Agent Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - Solaris 10 SPARC
  - Solaris 11 SPARC
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - Oracle Solaris documentation
  - SPARC platform documentation
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

# Solaris 10 + 11 SPARC Agent Standard

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

Define agent rules for Solaris on SPARC, including architecture-specific boot, firmware, and diagnostics differences.

<a id="when-to-use"></a>
## When to Use

- Administering SPARC Solaris hosts
- Working with OBP/eeprom/boot environments
- Managing zones, ZFS, SMF, and packages

<a id="when-not-to-use"></a>
## When Not to Use

- Do not assume x86 boot, UEFI, GRUB, or device naming.
- Do not change OpenBoot/eeprom variables without console access and rollback.

<a id="required-inputs"></a>
## Required Inputs

- Target environment name and lifecycle stage: proof-of-concept, development, testing, burn-in, or production.
- Exact OS, architecture, toolchain, firmware, package, database, or appliance version as applicable.
- Approved issue, ADR, DDN, CCR, runbook, or change ticket.
- Backout owner, maintenance window, test plan, and acceptance criteria for operational changes.
- Redacted configuration values or parameter names. Do not request or echo secrets.

<a id="non-negotiable-agent-rules"></a>
## Non-Negotiable Agent Rules

- Run read-only detection before package, service, network, kernel, boot, or storage changes.
- Do not assume service manager, package manager, network stack, filesystem, bootloader, or architecture from distribution name alone.
- Capture pre-change state, command output, and backout path before write operations.
- Use distribution-native package and service tools unless a runbook authorizes otherwise.
- Do not mix init systems or package sources without explicit compatibility review.
- Use `prtdiag`, `prtconf`, `eeprom`, and platform diagnostics for SPARC-specific discovery.
- Confirm console and LOM/ILOM access before boot changes.
- Treat OBP variables, boot-device, and firmware as critical resources.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
uname -a
isainfo -kv
prtdiag -v
prtconf -vp
eeprom
svcs -xv
zpool status
beadm list || bootadm list-menu
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Architecture/platform diagnostics
- OBP/eeprom snapshot
- Boot environment
- ZFS status
- SMF state

<a id="validation"></a>
## Validation

- Console path confirmed.
- Boot variables captured.
- ZFS/SMF healthy.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Restore eeprom variables.
- Boot previous BE.
- Use out-of-band console recovery.

<a id="references"></a>
## References

- https://docs.oracle.com/en/operating-systems/solaris.html

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
