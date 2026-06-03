---
template_id: YS-LANG-GROOVY-JENKINS-001
template_family: langsys
title: Groovy / Jenkins Scripting Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - Groovy
  - Jenkinsfile
  - Declarative Pipeline
  - Scripted Pipeline
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - Jenkins Pipeline Syntax Documentation
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

# Groovy / Jenkins Scripting Standard

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

Define controls for Jenkins Groovy pipeline code and operational CI/CD scripting.

<a id="when-to-use"></a>
## When to Use

- Editing Jenkinsfile
- Adding CI stages
- Writing shared-library pipeline code

<a id="when-not-to-use"></a>
## When Not to Use

- Do not add credential exposure, unpinned network downloads, or production deployment steps without approval.
- Do not use Scripted Pipeline where Declarative Pipeline suffices unless documented.

<a id="required-inputs"></a>
## Required Inputs

- Target environment name and lifecycle stage: proof-of-concept, development, testing, burn-in, or production.
- Exact OS, architecture, toolchain, firmware, package, database, or appliance version as applicable.
- Approved issue, ADR, DDN, CCR, runbook, or change ticket.
- Backout owner, maintenance window, test plan, and acceptance criteria for operational changes.
- Redacted configuration values or parameter names. Do not request or echo secrets.

<a id="non-negotiable-agent-rules"></a>
## Non-Negotiable Agent Rules

- Parameterize variable data through CLI arguments, config files, environment-variable schema, or secret/config services; never hardcode environment-specific values.
- Use deterministic inputs and outputs for tests and examples.
- Pin toolchain and runtime versions for reproducible work.
- Document public interfaces, failure modes, return codes, and security assumptions.
- Maintain backward-compatible command and data contracts unless a CCR authorizes a breaking change.
- Prefer Declarative Pipeline for auditable structure.
- Use Jenkins credentials binding without printing secrets.
- Pin build containers/tools and record versions.
- Separate build, test, security scan, package, provenance, and deploy stages.
- Require human gate for production deploys.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
jenkins-cli version
groovy --version
jenkinsfile-runner <Jenkinsfile>
grep -R "withCredentials\|sh " Jenkinsfile vars/
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Pipeline syntax validation
- Credential-use review
- Stage and agent map
- Build/test output
- Artifact/SBOM/provenance paths

<a id="validation"></a>
## Validation

- Pipeline loads.
- No secret echoing.
- Stages map to lifecycle gates.
- Rollback/deploy gates remain intact.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Revert Jenkinsfile/shared library.
- Disable job or restore previous job configuration.
- Rollback last deployment using release runbook.

<a id="references"></a>
## References

- https://www.jenkins.io/doc/book/pipeline/syntax/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
