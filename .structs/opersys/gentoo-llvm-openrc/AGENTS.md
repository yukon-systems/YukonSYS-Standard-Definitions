---
template_id: YS-OS-GENTOO-LLVM-OPENRC-001
template_family: opersys
title: Gentoo LLVM/Clang + OpenRC Agent Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - Gentoo
  - LLVM
  - Clang
  - OpenRC
  - no-systemd
  - GCC avoidance
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - Gentoo Handbook
  - Gentoo OpenRC documentation
  - LLVM/Clang documentation
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

# Gentoo LLVM/Clang + OpenRC Agent Standard

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

Define agent rules for Gentoo environments that require LLVM/Clang toolchains, OpenRC service management, GCC avoidance, and no systemd dependency.

<a id="when-to-use"></a>
## When to Use

- Administering Gentoo hosts with OpenRC
- Building software with Clang/LLVM
- Reviewing scripts for Gentoo-specific package/service behavior

<a id="when-not-to-use"></a>
## When Not to Use

- Do not invoke `systemctl` or assume systemd.
- Do not uninstall GCC or alter compiler profile without explicit approval; GCC avoidance means do not select GCC for new build outputs unless a package requires it.
- Do not run `emerge --sync` or world updates in production without change control.

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
- Use `emerge -pv` for planned changes before `emerge`.
- Set `CC=clang` and `CXX=clang++` only through approved build config or environment.
- Use OpenRC commands `rc-service`, `rc-status`, and `rc-update`.
- Preserve `/etc/portage` changes under version control or captured diff.
- Document USE flags, profile, ACCEPT_KEYWORDS, and LLVM slot/pin.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
emerge --info
eselect profile list
clang --version
llvm-config --version
rc-status
rc-service <service> status
rc-update show
emerge -pv <package>
dispatch-conf --help || etc-update --help
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- `emerge --info`
- Compiler version output
- OpenRC service status
- Planned package diff
- `/etc/portage` diff
- Backout package/version plan

<a id="validation"></a>
## Validation

- OpenRC service status unchanged or intentionally changed.
- Planned package changes match approval.
- Build uses Clang/LLVM as specified.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Revert `/etc/portage` changes.
- Reinstall previous package atom/version.
- Use `rc-service <service> restart|stop|start` as approved.

<a id="references"></a>
## References

- https://wiki.gentoo.org/wiki/Handbook:AMD64
- https://wiki.gentoo.org/wiki/OpenRC
- https://clang.llvm.org/docs/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
