---
template_id: YS-INFRA-SERIAL-LINUX-001
template_family: hwsys
title: RS232 / RS485 / TTL Serial via Linux Agent Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - Linux serial
  - RS232
  - RS485
  - TTL UART
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - Vendor/project documentation
  - DMTF Redfish where applicable
  - UEFI/U-Boot/man pages where applicable
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

# RS232 / RS485 / TTL Serial via Linux Agent Standard

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

Define agent controls for Linux serial console, USB UART, RS485 direction, permissions, and logging controls.

<a id="when-to-use"></a>
## When to Use

- Out-of-band management
- Firmware or boot inventory
- Runbook creation
- Read-only discovery before operational change

<a id="when-not-to-use"></a>
## When Not to Use

- Do not change power state, boot order, firmware, BIOS/UEFI, BMC users, serial speed, or bootloader environment without explicit approval and recovery path.
- Do not expose BMC credentials, session tokens, private keys, or serial console logs containing secrets.

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
- Confirm OOB reachability and console path before risky changes.
- Back up current configuration/environment where tool supports it.
- Use Redfish standard resources where available.
- Record asynchronous task IDs for firmware/config operations.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
dmesg | grep -i tty
ls -l /dev/ttyS* /dev/ttyUSB* /dev/ttyACM* 2>/dev/null
stty -F /dev/<tty> -a
picocom -b <baud> /dev/<tty>
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Hardware model/version
- Firmware/BMC/bootloader inventory
- Config/environment backup
- OOB reachability
- Task/job IDs
- Recovery path

<a id="validation"></a>
## Validation

- Read-only inventory succeeds.
- Recovery path verified.
- Post-change hardware/firmware state matches plan.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Restore previous config/environment.
- Use console/OOB recovery.
- Boot previous boot entry/image.
- Reflash previous firmware only with vendor-approved runbook.

<a id="references"></a>
## References

- https://www.dmtf.org/standards/redfish
- https://docs.u-boot.org/en/latest/
- https://uefi.org/specifications
- https://docs.nvidia.com/jetson/
- https://www.raspberrypi.com/documentation/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
