---
template_id: YS-HW-TURINGPI-MITX-JETSON-ORIN-NX-001
template_family: hwsys
title: Turing Pi mITX Board with Jetson Orin NX Agent Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - Turing Pi mITX Board with Jetson Orin NX
  - Turing Pi mITX
  - cluster board
  - BMC
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - Turing Pi documentation
  - Raspberry Pi documentation
  - NVIDIA Jetson documentation where applicable
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

# Turing Pi mITX Board with Jetson Orin NX Agent Standard

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

Define controls for Turing Pi mITX Board with Jetson Orin NX slot, BMC, node power, storage, networking, and serial workflows.

<a id="when-to-use"></a>
## When to Use

- Managing node slots
- Using BMC/API
- Mapping modules to network/serial/power controls
- Flashing node images

<a id="when-not-to-use"></a>
## When Not to Use

- Do not power-cycle all nodes unless approved.
- Do not flash the wrong slot.
- Do not assume CM and Jetson modules share power, boot, or image procedures.

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
- Map physical slot to node identity, MAC, serial, boot media, and workload role.
- Use BMC read-only inventory before power or flash commands.
- Validate cooling and power envelope for Jetson modules.
- Record per-node image checksum and firmware state.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
# Turing Pi BMC/API commands are installation-specific
ping <bmc>
curl -fsS https://<bmc>/api/<redacted>
ipmitool -I lanplus -H <bmc> -U <user> chassis power status || true
cat /proc/device-tree/model
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Slot map
- BMC version/config
- Node identity
- Power state
- Image checksum
- Serial console path

<a id="validation"></a>
## Validation

- Slot identity verified before action.
- Single-node action scope confirmed.
- Node returns to expected power/boot state.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Revert BMC setting.
- Power-cycle only affected node if approved.
- Restore prior image or boot media.

<a id="references"></a>
## References

- https://docs.turingpi.com/
- https://www.raspberrypi.com/documentation/
- https://docs.nvidia.com/jetson/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
