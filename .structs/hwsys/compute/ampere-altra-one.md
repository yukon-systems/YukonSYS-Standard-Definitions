---
template_id: YS-HW-AMPERE-ALTRA-ONE-001
template_family: hwsys
title: Ampere Altra and Ampere ONE Agent Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - Ampere Altra
  - Ampere Altra Max
  - Ampere ONE
  - Arm64 servers
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - Ampere product documentation
  - Linux arm64 administration documentation
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

# Ampere Altra and Ampere ONE Agent Standard

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

Define controls for Arm64 Ampere server platforms in HPC and critical-resource environments.

<a id="when-to-use"></a>
## When to Use

- Inventorying Ampere hosts
- Building or tuning Arm64 software
- Reviewing firmware/BMC/NUMA/performance behavior

<a id="when-not-to-use"></a>
## When Not to Use

- Do not apply x86-only tuning, microcode, MSR, BIOS, or compiler assumptions.
- Do not change firmware, NUMA, IRQ, hugepage, or kernel boot settings without performance/backout evidence.

<a id="required-inputs"></a>
## Required Inputs

- Target environment name and lifecycle stage: proof-of-concept, development, testing, burn-in, or production.
- Exact OS, architecture, toolchain, firmware, package, database, or appliance version as applicable.
- Approved issue, ADR, DDN, CCR, runbook, or change ticket.
- Backout owner, maintenance window, test plan, and acceptance criteria for operational changes.
- Redacted configuration values or parameter names. Do not request or echo secrets.

<a id="non-negotiable-agent-rules"></a>
## Non-Negotiable Agent Rules

- Identify exact hardware model, board revision, firmware version, BMC/controller version, OS, and architecture before action.
- Prefer read-only inventory and health commands before configuration changes.
- Do not power-cycle, reflash, reset, re-cable, repartition, or change boot order without explicit approval and console/rollback path.
- Capture pre-change state and post-change verification.
- Treat BMC, bootloader, firmware, network routing, and serial access as critical control planes.
- Capture `lscpu`, NUMA, memory, kernel, firmware, and BMC inventory.
- Use Arm64-compatible packages, containers, and compiler flags.
- Validate vector/atomic/endianness assumptions in software.
- Use `numactl`/hwloc evidence for performance-sensitive workloads.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
uname -m
lscpu
numactl --hardware
hwloc-ls
dmidecode -t system -t bios
ipmitool mc info
rasdaemon --status || true
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Architecture inventory
- NUMA map
- Firmware/BMC inventory
- Compiler target flags
- Performance baseline

<a id="validation"></a>
## Validation

- Arm64 build/test matrix passes.
- NUMA/performance settings match runbook.
- No x86-only flags remain.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Restore previous kernel args/tuning.
- Revert package/build flags.
- Use BMC console for recovery if boot changes fail.

<a id="references"></a>
## References

- https://amperecomputing.com/products/processors

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
