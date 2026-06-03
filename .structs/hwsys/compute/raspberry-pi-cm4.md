---
template_id: YS-HW-RPI-CM4-001
template_family: hwsys
title: Raspberry Pi CM4 Hardware Agent Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - Raspberry Pi CM4
  - Raspberry Pi Compute Module
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - Raspberry Pi Documentation
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

# Raspberry Pi CM4 Hardware Agent Standard

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

Define controls for Raspberry Pi CM4 carrier-board, boot, GPIO, eMMC/NVMe, and peripheral administration.

<a id="when-to-use"></a>
## When to Use

- Preparing images
- Changing boot or device-tree overlays
- Validating carrier board wiring and serial access

<a id="when-not-to-use"></a>
## When Not to Use

- Do not short pins, change GPIO overlays, or reflash eMMC/NVMe without board-specific runbook.
- Do not assume CM4 and CM5 carrier compatibility.

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
- Capture board revision and bootloader/eeprom state.
- Document carrier board, power budget, cooling, storage, GPIO, PCIe, and serial mappings.
- Use device-tree overlays only from approved configuration.
- Validate thermal throttling and undervoltage state before performance claims.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
cat /proc/device-tree/model
uname -a
vcgencmd version
vcgencmd get_throttled
lsblk
raspi-gpio get || pinctrl get
rpi-eeprom-update || true
dmesg | tail -n 200
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Board model/revision
- Bootloader version
- Storage map
- GPIO/overlay diff
- Thermal/power status
- Image checksum

<a id="validation"></a>
## Validation

- Boots repeatedly.
- No undervoltage/throttling in baseline.
- Expected interfaces enumerated.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Restore previous image.
- Remove overlay/config change.
- Use recovery boot/USB flashing procedure.

<a id="references"></a>
## References

- https://www.raspberrypi.com/documentation/computers/compute-module.html
- https://www.raspberrypi.com/documentation/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
