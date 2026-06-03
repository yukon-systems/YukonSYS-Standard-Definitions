---
template_id: YS-OS-DEVUAN-001
template_family: opersys
title: Devuan Agent Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - Devuan
  - sysvinit
  - runit
  - OpenRC
  - Debian-derived-no-systemd
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - Devuan documentation
  - Debian Reference
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

# Devuan Agent Standard

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

Define agent rules for Devuan hosts, with attention to differences from Debian and the absence of systemd as the default design point.

<a id="when-to-use"></a>
## When to Use

- Administering Devuan systems
- Porting Debian scripts to Devuan
- Managing services under sysvinit/runit/OpenRC

<a id="when-not-to-use"></a>
## When Not to Use

- Do not assume `systemctl`, `journalctl`, systemd units, or systemd timers.
- Do not install packages that force systemd without review.

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
- Detect init with `readlink /sbin/init` and service tool availability.
- Use `service`, `/etc/init.d/*`, `update-rc.d`, `sv`, or `rc-service` according to detected init.
- Use `apt`/`apt-get` and `dpkg` with Debian-family cautions.
- Document Debian compatibility assumptions and Devuan package differences.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
cat /etc/os-release
readlink -f /sbin/init
apt-cache policy <package>
dpkg -l | grep <package>
service --status-all
update-rc.d -n <service> defaults
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- OS release
- Init detection
- Package plan
- Service status
- Config diff
- Backout command list

<a id="validation"></a>
## Validation

- Service commands match detected init.
- Package plan does not introduce systemd dependencies unless approved.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Revert config.
- Use detected init to restart/disable service.
- Downgrade/remove package only with apt history and approval.

<a id="references"></a>
## References

- https://www.devuan.org/os/documentation
- https://www.debian.org/doc/manuals/debian-reference/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
