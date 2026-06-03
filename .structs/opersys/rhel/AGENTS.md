---
template_id: YS-OS-RHEL-9-10-001
template_family: opersys
title: Red Hat Enterprise Linux 9 + 10 Agent Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - RHEL 9
  - RHEL 10
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - Red Hat Enterprise Linux Documentation
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

# Red Hat Enterprise Linux 9 + 10 Agent Standard

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

Define agent rules for Red Hat Enterprise Linux 9 + 10 systems.

<a id="when-to-use"></a>
## When to Use

- Administering EL-family servers
- Package, service, network, firewall, kernel, or SELinux changes
- Preparing upgrade or compatibility evidence

<a id="when-not-to-use"></a>
## When Not to Use

- Do not mix third-party repositories or major versions without approval.
- Do not disable SELinux, firewalld, or security controls to make a task pass.

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
- Use `subscription-manager` where applicable.
- Use `dnf`, `rpm`, `systemctl`, `nmcli`, and `firewall-cmd` as native tools.
- Use Red Hat release and appstream lifecycle as source of truth.
- Capture SELinux mode and audit impact for security-sensitive changes.
- Use `leapp` or vendor-approved upgrade tooling for major upgrades only with a runbook.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
cat /etc/os-release
uname -r
dnf repolist --enabled
dnf history list | head
rpm -qa | sort
systemctl status <service> --no-pager
nmcli general status
firewall-cmd --state
getenforce
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- OS release
- Kernel
- Repo list
- Package transaction plan
- Service/firewall/SELinux status
- Rollback package list

<a id="validation"></a>
## Validation

- Approved repos only.
- SELinux/firewall state not weakened.
- Service health validated.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- dnf history undo <id>
- Restore previous config and restart service.
- Boot previous kernel from bootloader if approved.

<a id="references"></a>
## References

- https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9
- https://docs.oracle.com/en/operating-systems/oracle-linux/9/
- https://docs.rockylinux.org/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
