---
template_id: YS-OS-DEBIAN-12PLUS-001
template_family: opersys
title: Debian >=12 Agent Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - Debian 12
  - Debian 13
  - Debian >=12
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - Debian Reference
  - Debian Administrator Handbook
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

# Debian >=12 Agent Standard

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

Define agent rules for Debian 12 or later systems.

<a id="when-to-use"></a>
## When to Use

- Administering Debian servers
- Using apt/dpkg/systemd/networking tools
- Porting scripts across Debian-family systems

<a id="when-not-to-use"></a>
## When Not to Use

- Do not assume Debian behavior on Devuan.
- Do not mix stable/testing/unstable or third-party repositories without approval.

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
- Use `apt`/`apt-get` and `dpkg` for packages.
- Use systemd tools only after verifying the host uses systemd.
- Use `iproute2`, `nft`, and distribution network tooling per host config.
- Capture apt policy and held packages before changes.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
cat /etc/os-release
systemctl --version
apt-cache policy <package>
apt-mark showhold
dpkg -l
journalctl -u <service> -n 100 --no-pager
ip addr
ip route
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- OS release
- Package policy
- Held packages
- Service status/logs
- Network state
- Config diff

<a id="validation"></a>
## Validation

- Package changes are from approved repos.
- Service health and logs are acceptable.
- Network changes have connectivity validation.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- apt install <previous-version>
- systemctl revert <unit> || restore unit file
- Restore config from backup.

<a id="references"></a>
## References

- https://www.debian.org/doc/manuals/debian-reference/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
