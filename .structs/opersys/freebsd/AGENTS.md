---
template_id: YS-OS-FREEBSD-14-16-001
template_family: opersys
title: FreeBSD 14.x, 15.x, 16.x Agent Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - FreeBSD 14.x
  - FreeBSD 15.x
  - FreeBSD 16.x
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - FreeBSD Handbook
  - FreeBSD Manual Pages
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

# FreeBSD 14.x, 15.x, 16.x Agent Standard

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

Define agent rules for FreeBSD 14.x through 16.x hosts.

<a id="when-to-use"></a>
## When to Use

- Administering FreeBSD hosts
- Working with pkg, rc, jails, ZFS, pf/ipfw, bhyve, or kernel/network tuning

<a id="when-not-to-use"></a>
## When Not to Use

- Do not assume Linux systemd, iproute2, procfs, or GNU userland flags.
- Do not change `/etc/rc.conf`, loader tunables, jails, pf, storage, or boot without backup.

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
- Use `pkg`, `service`, `sysrc`, `freebsd-version`, and `uname`.
- Use `/etc/rc.conf`/`/boot/loader.conf` with explicit diffs.
- Use `ifconfig`, `netstat`, `sockstat`, `pfctl`, `jls`, and `zfs` as applicable.
- Create ZFS boot-environment/snapshot if the host uses ZFS and change risk warrants it.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
freebsd-version -kru
uname -a
pkg -vv
pkg info
service <service> status
sysrc -a
zpool status
zfs list
jls
pfctl -sr
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Release/kernel/userland
- Package repo info
- Service status
- rc.conf diff
- ZFS/jail/firewall state

<a id="validation"></a>
## Validation

- Kernel/userland versions are understood.
- Package repo matches policy.
- Service and network health validated.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- pkg install <previous-version>
- Restore `/etc/rc.conf` or `/boot/loader.conf`.
- Boot previous BE/snapshot if available.

<a id="references"></a>
## References

- https://docs.freebsd.org/en/books/handbook/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
