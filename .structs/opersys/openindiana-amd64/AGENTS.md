---
template_id: YS-OS-OPENINDIANA-AMD64-001
template_family: opersys
title: OpenIndiana AMD64 Agent Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - OpenIndiana
  - illumos
  - AMD64
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - OpenIndiana documentation
  - illumos documentation
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

# OpenIndiana AMD64 Agent Standard

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

Define agent rules for OpenIndiana/illumos AMD64 systems.

<a id="when-to-use"></a>
## When to Use

- Administering OpenIndiana hosts
- Using IPS packages, SMF, ZFS, dladm, ipadm, zones

<a id="when-not-to-use"></a>
## When Not to Use

- Do not assume Oracle Solaris support contracts or package repositories.
- Do not use Linux-only command flags.

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
- Use IPS `pkg`, SMF `svcs`/`svcadm`, ZFS, `dladm`, and `ipadm`.
- Capture boot environment with `beadm` before risky changes.
- Document illumos/OpenIndiana package publisher state.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
cat /etc/release
uname -a
pkg publisher
pkg list -v <pkg>
svcs -xv
zpool status
beadm list
dladm show-link
ipadm show-addr
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Release
- Publisher list
- Package plan
- SMF/ZFS/network state
- Boot environment

<a id="validation"></a>
## Validation

- IPS publisher approved.
- Boot environment available for risky changes.
- SMF/ZFS/network healthy.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Activate previous BE.
- Restore SMF/config snapshot.
- Rollback ZFS snapshot if approved.

<a id="references"></a>
## References

- https://www.openindiana.org/documentation/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
