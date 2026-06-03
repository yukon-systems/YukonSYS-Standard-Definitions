---
template_id: YS-NET-MIKROTIK-ROUTEROS-001
template_family: hwsys
title: MikroTik RouterOS Agent Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - MikroTik RouterOS
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - Vendor/project documentation
  - IETF or protocol specifications where applicable
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

# MikroTik RouterOS Agent Standard

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

Define agent controls for RouterOS CLI, export, package, routing, firewall, and safe-mode practices.

<a id="when-to-use"></a>
## When to Use

- Network discovery
- Configuration review
- Pre-change and post-change validation
- Runbook generation

<a id="when-not-to-use"></a>
## When Not to Use

- Do not change live routing, firewall, switchport, VPN, SSH, TLS, or management-plane access without explicit approval and out-of-band recovery path.
- Do not paste live secrets, keys, SNMP communities, PSKs, certificates, or private topology into generated artifacts.

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
- Always backup/export configuration before changes.
- Use commit-confirm/safe-mode/reload-timer patterns when available.
- Validate management-plane reachability before and after.
- Record interface, route, firewall, and neighbor state for network changes.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
/system resource print
/system package print
/export hide-sensitive
/interface print
/ip/address/print
/ip/route/print
/system/backup/save name=<name>
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Device/version inventory
- Config backup/export with secrets hidden
- Interface/route/firewall state
- Management reachability test
- Rollback command sequence

<a id="validation"></a>
## Validation

- Read-only commands match target device family.
- Backup exists before write.
- Post-change reachability and service checks pass.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Restore previous config.
- Use safe-mode revert, commit-confirm timeout, archive rollback, or reload timer as platform supports.
- Use console/OOB path if management is lost.

<a id="references"></a>
## References

- https://help.mikrotik.com/docs/
- https://docs.opnsense.org/
- https://www.arista.com/en/um-eos/eos-overview
- https://openwrt.org/docs/start
- https://docs.vyos.io/en/rolling/
- https://www.openssh.org/manual.html
- https://docs.openssl.org/master/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
