## Recommendation

Treat this as a **standards catalog** with two layers:

1. **Executable platform templates**: files GitHub actually consumes, such as `.github/ISSUE_TEMPLATE/*.yml`, `.github/PULL_REQUEST_TEMPLATE/*.md`, `CONTRIBUTING.md`, `SECURITY.md`, and wiki pages.
2. **Reusable YukonSYS standard definitions**: vendor-neutral canonical templates under `structs/`, with source notes, field schemas, examples, and adaptation rules.

Your current repo already has the right shape: it contains `.github/PULL_REQUEST_TEMPLATE`, `structs`, `README.SPEC.md`, and README material; the PR template README already defines multiple PR templates and reviewer checks such as “what changed,” “why needed now,” evidence, validation, rollback, and secret safety. ([GitHub][1]) The existing README specification also gives a useful model for strict template requirements: supported formats, required ordering, no broken links, linted examples, required title, and short description constraints. ([GitHub][2]) The current `structs` taxonomy already includes `agentsys`, `hwsys`, `langsys`, and `opersys`, so most of the requested additions should fit cleanly under `langsys`, `opersys`, and `hwsys`. ([GitHub][3])

---

## 1. GitHub / Git-style pull request and issue standards

GitHub supports issue templates and PR templates to standardize what contributors submit; issue forms can be YAML-based structured forms in `.github/ISSUE_TEMPLATE`, while PR templates are Markdown files that GitHub can auto-load for new pull requests. ([GitHub Docs][4]) GitHub also supports organization-wide default community health files such as `CONTRIBUTING`, `CODE_OF_CONDUCT`, `SECURITY.md`, issue templates, and discussion forms through a public `.github` repository. ([GitHub Docs][5])

### Add these PR templates

Suggested path:

```text
.github/PULL_REQUEST_TEMPLATE/
structs/opersys/git/pull-request/
```

Recommended templates:

| Template                       | Use case                                                                        |
| ------------------------------ | ------------------------------------------------------------------------------- |
| `generic-change.md`            | Default change request. Keep this as the fallback.                              |
| `code-change.md`               | Source-code changes with tests, risk, API impact, and review checklist.         |
| `docs-change.md`               | Documentation-only updates.                                                     |
| `infrastructure-change.md`     | Terraform, Ansible, Kubernetes, networking, IAM, CI/CD, or environment changes. |
| `automation-tooling.md`        | Scripts, CLIs, build tooling, developer tooling.                                |
| `security-sensitive-change.md` | Auth, crypto, secrets, access control, scanning, hardening.                     |
| `dependency-upgrade.md`        | Library, base image, OS package, or firmware dependency changes.                |
| `release-pr.md`                | Release branch, changelog, version bump, artifacts, rollback.                   |
| `emergency-change.md`          | Break-glass or incident-driven production fixes.                                |
| `decommission-removal.md`      | Removing services, repos, endpoints, hardware, jobs, or data.                   |

Minimum PR sections:

```markdown
# Summary
# Change Type
# Linked Issue / Change / Incident
# Risk Classification
# Security / Secrets / Privacy Impact
# Test Evidence
# Operational Impact
# Rollback / Recovery Plan
# Reviewer Checklist
# Post-Merge Tasks
```

Also add a commit-message standard based on **Conventional Commits**, which defines a lightweight commit message convention with a type, optional scope, description, optional body, and optional footers, and is designed to support automation and semantic versioning. ([Conventional Commits][6])

### Add these issue definitions

Suggested path:

```text
.github/ISSUE_TEMPLATE/
structs/opersys/git/issue/
```

Recommended issue forms:

| Template              |                             GitHub form filename | ITSM mapping                      |
| --------------------- | -----------------------------------------------: | --------------------------------- |
| Bug / Defect          |                                        `bug.yml` | Incident or defect                |
| Feature Request       |                            `feature_request.yml` | Enhancement                       |
| Task                  |                                       `task.yml` | Work item                         |
| Documentation Gap     |                          `documentation_gap.yml` | Knowledge improvement             |
| Service Request       |                            `service_request.yml` | ITIL request fulfillment          |
| Incident              |                                   `incident.yml` | ITIL incident                     |
| Problem               |                                    `problem.yml` | ITIL problem management           |
| Change Request        |                             `change_request.yml` | ITIL change enablement            |
| Security Finding      | `security_finding.yml` or `SECURITY.md` redirect | Vulnerability / security incident |
| Hardware Fault        |                             `hardware_fault.yml` | Hardware incident                 |
| Network Request       |                            `network_request.yml` | Infrastructure change/request     |
| RFC / Design Proposal |                        `rfc_design_proposal.yml` | Architecture decision input       |

Use GitHub labels as a controlled vocabulary, not ad hoc tags. GitHub labels can be applied to issues and other repository items, and GitHub’s issue form syntax supports YAML-defined fields, validation, default labels, and assignees. ([GitHub Docs][7])

Suggested core labels:

```text
type/bug
type/feature
type/task
type/incident
type/problem
type/change
type/service-request
type/security
type/hardware
type/docs

priority/p0
priority/p1
priority/p2
priority/p3
priority/p4

state/needs-triage
state/accepted
state/blocked
state/in-progress
state/waiting-on-reporter
state/waiting-on-vendor
state/needs-approval
state/needs-validation
state/ready-to-close

risk/low
risk/medium
risk/high
risk/critical
```

---

## 2. Programming language docstring and style-guide standards

For `langsys`, create one canonical directory per language with at least:

```text
structs/langsys/<language>/
  style-guide.md
  docstring-standard.md
  linting-standard.md
  formatting-standard.md
  code-review-checklist.md
  example.good.<ext>
  example.bad.<ext>
```

### Recommended source standards

| Language / area         | Standard sources to build from                                                                                                                                                                                                                                                     | Recommended YukonSYS artifacts                                                                |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| Python                  | PEP 257 defines Python docstring conventions, including what counts as a docstring, where public docstrings are expected, and one-line vs multi-line conventions; PEP 8 covers Python style and emphasizes readability and consistency. ([Python Enhancement Proposals (PEPs)][8]) | `python/docstring-standard.md`, `python/style-guide.md`, `python/pylint-ruff-black-policy.md` |
| Python, Google style    | Google’s Python Style Guide gives import, lint, formatting, and docstring guidance; its docstring section requires module, function, and class docstrings in specific contexts and defines `Args`, `Returns`, `Yields`, and `Attributes` sections. ([Google][9])                   | `python/google-docstring-profile.md`                                                          |
| Go                      | Effective Go documents idiomatic Go naming, formatting, and program construction; Go doc comments are extracted by Go documentation tools. ([Go][10])                                                                                                                              | `go/effective-go-profile.md`, `go/doc-comment-standard.md`                                    |
| JavaScript / TypeScript | JSDoc documents JavaScript APIs using tags, configuration, and templates; TypeScript supports much JSDoc syntax and TypeScript-specific documentation conventions. ([JSDoc][11])                                                                                                   | `js-ts/jsdoc-standard.md`, `js-ts/typescript-style.md`                                        |
| Java                    | Google Java Style Guide defines Google’s Java source conventions; Oracle’s Java conventions remain useful as a historical baseline for file organization and naming. ([Google][12])                                                                                                | `java/style-guide.md`, `java/javadoc-standard.md`                                             |
| C++                     | Google’s C++ Style Guide is oriented around managing complexity and maintaining a large codebase. ([Google][13])                                                                                                                                                                   | `cpp/style-guide.md`, `cpp/header-comment-standard.md`                                        |
| Rust                    | Rust API Guidelines cover Rust API design and presentation, and the rustdoc book covers how to write Rust documentation. ([Rust Programming Language][14])                                                                                                                         | `rust/api-guidelines-profile.md`, `rust/rustdoc-standard.md`                                  |
| Shell                   | Google’s style guide repo includes a Shell Style Guide among its language guides. ([GitHub][15])                                                                                                                                                                                   | `shell/style-guide.md`, `shell/shellcheck-policy.md`                                          |

For each language, define:

```yaml
doc_comment_required_for:
  - public modules/packages
  - public classes/types
  - public functions/methods
  - exported constants
  - non-obvious private helpers
required_sections:
  - purpose
  - parameters
  - return_value
  - errors_or_exceptions
  - side_effects
  - examples
  - security_notes
  - operational_notes
```

---

## 3. Wiki page templates

GitHub wikis are intended for long-form repository documentation, while the README should remain the quick project introduction. ([GitHub Docs][16])

Suggested path:

```text
structs/opersys/wiki/
```

Recommended wiki templates:

| Template                   | Purpose                                                  |
| -------------------------- | -------------------------------------------------------- |
| `home-page.md`             | Wiki landing page, service index, owner map.             |
| `service-overview.md`      | Purpose, users, dependencies, interfaces, support model. |
| `architecture-overview.md` | Components, diagrams, data flows, trust boundaries.      |
| `runbook-index.md`         | Links to operational runbooks by service/system.         |
| `release-notes.md`         | Version, changes, compatibility, migration notes.        |
| `onboarding.md`            | New operator/developer setup path.                       |
| `faq.md`                   | Known issues and recurring questions.                    |
| `glossary.md`              | Controlled vocabulary.                                   |
| `adr.md`                   | Architecture Decision Record.                            |
| `rfc.md`                   | Design proposal / review request.                        |
| `post-incident-review.md`  | Incident timeline, impact, causes, actions.              |
| `service-catalog-entry.md` | Business-facing service catalog page.                    |

Minimum wiki page front matter:

```yaml
title:
template_id:
owner_role:
service:
audience:
last_reviewed:
review_cadence:
classification:
related_runbooks:
related_slos:
related_slas:
```

---

## 4. SLO and SLA templates

SLOs should be service reliability objectives measured by SLIs; Google SRE guidance defines an SLO as a target value or range for a service level measured by an SLI, and the SRE Workbook frames SLOs as the basis for data-driven reliability decisions. ([Google SRE][17]) SLAs are more customer- or contract-facing: Atlassian describes an SLA as a plain-language agreement defining delivered services, responsiveness, measurement, and remedies or redress if breached. ([Atlassian][18])

Suggested path:

```text
structs/opersys/sre/
  slo/
  sla/
```

### SLO template

```markdown
# Service Level Objective

## Service
## User Journey
## SLI
## SLO Target
## Measurement Window
## Data Source
## Query / Calculation
## Good Events
## Total Events
## Exclusions
## Error Budget
## Alerting Policy
## Ownership
## Review Cadence
## Known Risks
## Related Runbooks
```

Recommended SLO examples to include:

| SLO type               | Example fields                             |
| ---------------------- | ------------------------------------------ |
| Availability           | successful requests / total valid requests |
| Latency                | percentage of requests under threshold     |
| Freshness              | data age below threshold                   |
| Correctness            | valid output / total output                |
| Durability             | accepted writes not lost                   |
| Support responsiveness | tickets responded within target            |

Google’s SRE example SLO document uses service overview, availability, latency, and freshness style objectives, so that structure maps well to a YukonSYS template. ([Google SRE][19])

### SLA template

```markdown
# Service Level Agreement

## Parties
## Service Description
## Scope
## Support Hours
## Availability Commitment
## Response Targets
## Resolution / Restoration Targets
## Maintenance Windows
## Customer Responsibilities
## Provider Responsibilities
## Exclusions
## Measurement and Reporting
## Escalation
## Remedies / Credits / Consequences
## Review and Renewal
```

---

## 5. ITIL / ITSM templates

ITIL is a service management framework for digital products and services; ITIL 4 organizes guidance around management practices such as incident management, service level management, deployment management, and organizational change management. ([PeopleCert][20]) PeopleCert’s ITIL practice pages identify change enablement, incident management, service request management, and service level management as distinct practices with their own process and activity guidance. ([PeopleCert][21])

Suggested path:

```text
structs/opersys/itil/
```

### Change control templates

| Template                    | Purpose                                                     |
| --------------------------- | ----------------------------------------------------------- |
| `standard-change.md`        | Pre-approved, low-risk, repeatable change.                  |
| `normal-change.md`          | Planned change requiring review and approval.               |
| `emergency-change.md`       | Urgent change to restore service or mitigate critical risk. |
| `change-risk-assessment.md` | Risk, impact, blast radius, reversibility.                  |
| `cab-agenda.md`             | Change Advisory Board agenda.                               |
| `cab-minutes.md`            | CAB decisions, approvals, conditions.                       |
| `maintenance-window.md`     | Window, affected services, contacts, rollback.              |
| `rollback-plan.md`          | Decision point, steps, validation, owner.                   |

ServiceNow describes change management as controlling the lifecycle of changes to enable beneficial changes with minimum disruption, and Atlassian provides a change management planning template for organizing request information and implementation plans. ([ServiceNow][22])

### Incident triage / service-oriented triage templates

| Template                       | Purpose                                                   |
| ------------------------------ | --------------------------------------------------------- |
| `incident-intake.md`           | Initial report capture.                                   |
| `incident-triage.md`           | Categorize, prioritize, assign, escalate.                 |
| `major-incident.md`            | P0/P1 coordination, comms, bridge, roles.                 |
| `service-impact-assessment.md` | User impact, scope, duration, affected dependencies.      |
| `incident-comms-update.md`     | Internal/external status update.                          |
| `incident-closure.md`          | Restoration evidence and closure criteria.                |
| `post-incident-review.md`      | Timeline, root cause, contributing factors, action items. |

ServiceNow’s incident management process includes identifying/logging incidents, classifying, prioritizing, assigning, escalating, resolving, and reporting. ([ServiceNow][23]) Atlassian’s postmortem template covers timeline, root cause analysis, impact assessment, and lessons learned, while PagerDuty publishes incident response and runbook material suitable for operational adaptation. ([Atlassian][24])

### ITIL service management / managerial templates

| Template                   | Purpose                                             |
| -------------------------- | --------------------------------------------------- |
| `service-catalog-entry.md` | Business-facing service definition.                 |
| `service-owner-charter.md` | Accountable owner, duties, authority.               |
| `support-model.md`         | L1/L2/L3 support, escalation, coverage.             |
| `ola.md`                   | Operational Level Agreement between internal teams. |
| `raci.md`                  | Responsible, accountable, consulted, informed.      |
| `service-review.md`        | Monthly/quarterly service review.                   |
| `risk-register.md`         | Operational risks, controls, owners.                |
| `knowledge-article.md`     | Reusable support knowledge.                         |
| `known-error-record.md`    | Workaround and permanent fix status.                |
| `problem-record.md`        | Recurring incident investigation.                   |

---

## 6. System, service, and hardware runbook templates

A runbook should be a detailed “how-to” for repeatable operational procedures; PagerDuty’s runbook guidance frames runbooks as step-by-step guides for common IT operations such as provisioning, updates, configuration changes, and opening ports. ([PagerDuty][25])

Suggested path:

```text
structs/opersys/runbook/
structs/hwsys/runbook/
```

### Service runbook

```markdown
# Service Runbook

## Service Summary
## Owner / Escalation
## Environments
## Dependencies
## Dashboards
## Alerts
## SLOs / SLAs
## Common Failure Modes
## Triage Procedure
## Restart / Recovery Procedure
## Backup / Restore Procedure
## Rollback Procedure
## Scaling Procedure
## Security Notes
## Validation Checks
## Communication Templates
## Change History
```

Google SRE monitoring guidance recommends dashboards that answer basic operational questions and include key service signals; its on-call guidance frames production response around urgency, diagnosis, mitigation, repair, and escalation. ([Google SRE][26])

### System operator runbook

```markdown
# System Operator Runbook

## System Mission
## Normal State
## Watch / Shift Duties
## Access Requirements
## Startup
## Shutdown
## Health Checks
## Event Log Review
## Alarm Response
## Failover
## Recovery
## Escalation
## Watch Handoff
## Daily / Weekly / Monthly Tasks
```

### Hardware-specific runbooks

Recommended hardware runbook families:

```text
server-bmc-runbook.md
storage-array-runbook.md
network-switch-runbook.md
firewall-runbook.md
load-balancer-runbook.md
pdu-ups-runbook.md
rack-cabling-runbook.md
firmware-upgrade-runbook.md
hardware-replacement-rma.md
console-recovery-runbook.md
```

For DoD-aligned secure configuration, include DISA STIG/SRG references where applicable; DISA describes STIGs and SRGs as security technical implementation and requirements guides for DoD information technology. ([Cyber.mil][27])

---

## 7. DoD / military SITREP, situation response, and operator runbooks

For public, unclassified DoD-style reporting templates, build from public reporting doctrine and training references, not from classified/local SOPs. The current CJCSM 3150.05F Joint Reporting System Situation Monitoring Manual is dated February 28, 2025 and provides guidance for Commander’s SITREP and OPREP reporting; it states that these reports provide timely information on critical situations, military operations, and disaster events. ([Joint Chiefs of Staff][28]) The manual also describes the Commander’s SITREP as a multipurpose narrative report and stresses that SITREPs should highlight key activities, build on prior reports, avoid duplication, and preserve brevity. ([Joint Chiefs of Staff][28]) DINFOS also publishes a public-affairs SITREP template focused on clear, concise current data for the chain of command. ([Pavilion][29])

Suggested path:

```text
structs/opersys/dod/
structs/opersys/military/
```

Recommended templates:

| Template                     | Purpose                                           |
| ---------------------------- | ------------------------------------------------- |
| `sitrep.md`                  | Situation report.                                 |
| `sitrep-pa.md`               | Public affairs SITREP variant.                    |
| `situation-response.md`      | Operational response plan for a developing event. |
| `watch-handoff.md`           | Shift turnover / watch relief.                    |
| `commander-update.md`        | Executive/commander-facing update.                |
| `system-operator-runbook.md` | Mission system operator procedures.               |
| `communications-outage.md`   | Comms degradation response.                       |
| `readiness-report.md`        | Readiness/status snapshot.                        |
| `battle-rhythm.md`           | Scheduled reporting and operating cadence.        |
| `after-action-review.md`     | AAR, lessons learned, corrective actions.         |

### SITREP skeleton

```markdown
# Situation Report

## Classification / Handling
## Report Identifier
## Date-Time Group
## Reporting Unit / Organization
## Reporting Period
## Situation Overview
## Own Status / Disposition
## Operations
## Critical Assets
## Intelligence / Reconnaissance
## Logistics
## Communications / Connectivity
## Personnel
## Significant Political / Military / Diplomatic Events
## Commander / Lead Assessment
## Current Actions
## Requested Support
## Next Report Time
```

Do not publish live reporting channels, classified handling procedures, tactical frequencies, real unit identifiers, real response thresholds, or system-sensitive operational details in a public repository.

---

## 8. Cybersecurity, secure SDLC, API, and supply-chain standards to add

These are adjacent but useful additions to the requested set.

Suggested path:

```text
structs/opersys/security/
structs/opersys/sdlc/
structs/opersys/api/
structs/opersys/supply-chain/
```

| Standard area                     | Source basis                                                                                                                                                                                 | Recommended templates                                                                  |
| --------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| Incident response                 | NIST SP 800-61 Rev. 3 provides recommendations for preparing for incidents, reducing impact, and improving detection, response, and recovery. ([NIST Computer Security Resource Center][30]) | `security-incident-playbook.md`, `evidence-preservation.md`, `containment-recovery.md` |
| Secure SDLC                       | NIST SP 800-218 SSDF defines high-level secure software development practices that can be integrated into SDLC models. ([NIST Computer Security Resource Center][31])                        | `secure-design-review.md`, `secure-code-review.md`, `release-security-checklist.md`    |
| Application security verification | OWASP ASVS provides a basis for testing web application technical security controls and gives developers security requirements for secure development. ([OWASP Foundation][32])              | `asvs-control-mapping.md`, `application-security-review.md`                            |
| API interface standards           | OpenAPI defines a standard, language-agnostic interface for HTTP APIs so humans and computers can understand service capabilities. ([Swagger][33])                                           | `openapi-review.md`, `api-design-checklist.md`, `api-compatibility-review.md`          |
| SBOM / supply chain               | SPDX is an open standard for representing systems with software components as SBOMs and related security/license metadata. ([SPDX][34])                                                      | `sbom-policy.md`, `dependency-risk-review.md`, `third-party-component-intake.md`       |

---

## 9. Suggested repo layout

```text
.github/
  ISSUE_TEMPLATE/
    bug.yml
    incident.yml
    change_request.yml
    service_request.yml
    security_finding.yml
    hardware_fault.yml
  PULL_REQUEST_TEMPLATE/
    generic-change.md
    code-change.md
    infrastructure-change.md
    security-sensitive-change.md
    emergency-change.md
  CONTRIBUTING.md
  SECURITY.md

structs/
  langsys/
    python/
    go/
    js-ts/
    java/
    cpp/
    rust/
    shell/
  opersys/
    git/
      issue/
      pull-request/
      labels/
      conventional-commits/
    wiki/
    sre/
      slo/
      sla/
    itil/
      change-control/
      incident-management/
      service-management/
      problem-management/
    runbook/
      service/
      system/
      operator/
    security/
      incident-response/
      secure-sdlc/
      appsec/
    api/
    supply-chain/
    dod/
      sitrep/
      situation-response/
      operator-runbook/
  hwsys/
    runbook/
      server-bmc/
      storage/
      network/
      firewall/
      pdu-ups/
      firmware/
      rma/
  agentsys/
    operator-agent/
    triage-agent/
    documentation-agent/
```

---

## 10. Canonical metadata contract for every YukonSYS template

Use this header across all templates so they remain machine-indexable and reviewable:

```yaml
template_id:
template_family:
title:
version:
status: draft|active|deprecated
owner_role:
applies_to:
audience:
source_basis:
classification:
required_fields:
optional_fields:
validation_rules:
related_templates:
review_cadence:
last_reviewed:
change_control:
```

Then every template should include:

```markdown
# Purpose
# When to Use
# When Not to Use
# Required Inputs
# Procedure / Form Body
# Evidence Required
# Approval / Review Requirements
# Risk and Impact
# Security / Privacy / Compliance Notes
# Rollback / Recovery / Exit Criteria
# Examples
# References
# Version History
```

---

## Highest-value additions to implement first

1. **Issue forms**: `incident.yml`, `change_request.yml`, `service_request.yml`, `problem.yml`, `security_finding.yml`.
2. **PR templates**: `code-change.md`, `security-sensitive-change.md`, `infrastructure-change.md`, `emergency-change.md`.
3. **SRE package**: `slo.md`, `sla.md`, `service-runbook.md`, `post-incident-review.md`.
4. **ITIL package**: `normal-change.md`, `emergency-change.md`, `incident-triage.md`, `service-catalog-entry.md`.
5. **Operator package**: `system-operator-runbook.md`, `watch-handoff.md`, `hardware-fault.md`, `firmware-upgrade.md`.
6. **DoD-style public templates**: `sitrep.md`, `situation-response.md`, `after-action-review.md`.
7. **Secure SDLC package**: `secure-design-review.md`, `secure-code-review.md`, `sbom-policy.md`, `api-design-checklist.md`.

[1]: https://github.com/yukon-systems/YukonSYS-Standard-Definitions "GitHub - yukon-systems/YukonSYS-Standard-Definitions: A collection of language definitions + syntax standards for programming, analytics, automation services, and systems architectures · GitHub"
[2]: https://github.com/yukon-systems/YukonSYS-Standard-Definitions/blob/master/README.SPEC.md "YukonSYS-Standard-Definitions/README.SPEC.md at master · yukon-systems/YukonSYS-Standard-Definitions · GitHub"
[3]: https://github.com/yukon-systems/YukonSYS-Standard-Definitions/tree/master/structs "YukonSYS-Standard-Definitions/structs at master · yukon-systems/YukonSYS-Standard-Definitions · GitHub"
[4]: https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/about-issue-and-pull-request-templates "About issue and pull request templates - GitHub Docs"
[5]: https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file "Creating a default community health file - GitHub Docs"
[6]: https://www.conventionalcommits.org/en/v1.0.0/?utm_source=chatgpt.com "Conventional Commits"
[7]: https://docs.github.com/en/issues/using-labels-and-milestones-to-track-work/managing-labels?utm_source=chatgpt.com "Managing labels"
[8]: https://peps.python.org/pep-0257/ "PEP 257 – Docstring Conventions | peps.python.org"
[9]: https://google.github.io/styleguide/pyguide.html "styleguide | Style guides for Google-originated open-source projects"
[10]: https://go.dev/doc/effective_go?utm_source=chatgpt.com "Effective Go - The Go Programming ..."
[11]: https://jsdoc.app/?utm_source=chatgpt.com "Use JSDoc: Index"
[12]: https://google.github.io/styleguide/javaguide.html?utm_source=chatgpt.com "Google Java Style Guide"
[13]: https://google.github.io/styleguide/cppguide.html?utm_source=chatgpt.com "Google C++ Style Guide"
[14]: https://rust-lang.github.io/api-guidelines/about.html?utm_source=chatgpt.com "About - Rust API Guidelines"
[15]: https://github.com/google/styleguide "GitHub - google/styleguide: Style guides for Google-originated open-source projects · GitHub"
[16]: https://docs.github.com/communities/documenting-your-project-with-wikis/about-wikis "About wikis - GitHub Docs"
[17]: https://sre.google/sre-book/service-level-objectives/?utm_source=chatgpt.com "Defining slo: service level objective meaning"
[18]: https://www.atlassian.com/itsm/service-request-management/slas?utm_source=chatgpt.com "What is an SLA: SLA Meaning & Examples"
[19]: https://sre.google/workbook/slo-document/?utm_source=chatgpt.com "Appendix A - Example SLO Document"
[20]: https://www.peoplecert.org/Frameworks-Professionals/ITIL-framework?utm_source=chatgpt.com "ITIL Framework"
[21]: https://www.peoplecert.org/browse-certifications/it-governance-and-service-management/ITIL-1/itil-4-practitioner-change-enablement-3794?utm_source=chatgpt.com "ITIL 4 Practitioner: Change Enablement"
[22]: https://www.servicenow.com/docs/r/it-service-management/change-management/c_ITILChangeManagement.html?utm_source=chatgpt.com "Change Management"
[23]: https://www.servicenow.com/docs/r/it-service-management/incident-management/incident-management-process.html?utm_source=chatgpt.com "Exploring Incident Management"
[24]: https://www.atlassian.com/incident-management/postmortem/templates?utm_source=chatgpt.com "Incident postmortem process: Track, document, and improve"
[25]: https://www.pagerduty.com/resources/automation/learn/what-is-a-runbook/?utm_source=chatgpt.com "What is a Runbook?"
[26]: https://sre.google/sre-book/monitoring-distributed-systems/?utm_source=chatgpt.com "Chapter 6 - Monitoring Distributed Systems"
[27]: https://public.cyber.mil/stigs/?utm_source=chatgpt.com "Security Technical Implementation Guides (STIGs)"
[28]: https://www.jcs.mil/Portals/36/Documents/Library/Manuals/CJCSM%203150.05F.pdf "«classification» THE JOINT STAFF WASHINGTON DC"
[29]: https://pavilion.dinfos.edu/Template/Article/2661563/during-a-crisis-public-affairs-sitrep/?utm_source=chatgpt.com "During a Crisis: Public Affairs SITREP"
[30]: https://csrc.nist.gov/pubs/sp/800/61/r3/final?utm_source=chatgpt.com "SP 800-61 Rev. 3, Incident Response Recommendations and ..."
[31]: https://csrc.nist.gov/pubs/sp/800/218/final?utm_source=chatgpt.com "Secure Software Development Framework (SSDF) Version 1.1 ..."
[32]: https://owasp.org/www-project-application-security-verification-standard/?utm_source=chatgpt.com "OWASP Application Security Verification Standard (ASVS)"
[33]: https://swagger.io/specification/?utm_source=chatgpt.com "OpenAPI Specification - Version 3.1.0"
[34]: https://spdx.dev/?utm_source=chatgpt.com "SPDX – Linux Foundation Projects Site"
