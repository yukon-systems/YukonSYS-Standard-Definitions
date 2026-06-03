# Agent Rules

<a id="toc"></a>
## Table of Contents

- [Purpose](#purpose)
- [Repository Intake](#repository-intake)
- [Routing Table](#routing-table)
- [Required Records](#required-records)
- [Stop Conditions](#stop-conditions)

<a id="purpose"></a>
## Purpose

Route agentic workers to the correct standards, templates, and evidence files. These rules supplement root `AGENTS.md` and do not weaken it.

<a id="repository-intake"></a>
## Repository Intake

Agents MUST read the following before editing policy-sensitive content:

1. `AGENTS.md`
2. `.structs/agentsys/AGENT_RULES.md`
3. `.structs/agentsys/AGENT_AUGMENTS.md`
4. `references/REFERENCE_INDEX.md`
5. `docs/evidence-index.md`
6. The relevant template under `templates/`, `docs/`, `.github/`, or `.structs/`.

<a id="routing-table"></a>
## Routing Table

| Workflow Type | Required Directory | Required Template / Evidence |
|---|---|---|
| Architecture decision | `docs/adr/` | `docs/adr/ADR-TEMPLATE.md` |
| Scope deviation | `docs/ddn/` | `docs/ddn/DDN-TEMPLATE.md` |
| Compatibility change | `docs/ccr/` | `docs/ccr/CCR-TEMPLATE.md` |
| Performance burn-in | `docs/per/` | `docs/per/PER-TEMPLATE.md` |
| Release | `release/records/` | `release/records/RELEASE-RECORD-TEMPLATE.md` |
| Exception | `docs/exceptions/` | `docs/exceptions/EXCEPTION-TEMPLATE.md` |
| GitHub issue intake | `.github/ISSUE_TEMPLATE/` | matching `*.yml` form |
| GitHub pull request | `.github/PULL_REQUEST_TEMPLATE/` | matching `*.md` template |
| Evidence index | `docs/` | `docs/evidence-index.md`, `docs/evidence-index.yaml` |
| CI/CD gate | `ci/` | `ci/workflow-gates.md` |
| SBOM | `release/sbom/` | `bom.json.template`, `spdx.json.template` |
| Provenance | `release/provenance/` | `slsa-provenance.intoto.jsonl.template` |
| Language standards | `.structs/langsys/` | relevant `STANDARD.md` |
| OS operator standards | `.structs/opersys/` | relevant `AGENTS.md` or template |
| Hardware standards | `.structs/hwsys/` | relevant hardware/runbook file |
| Specification controls | `.structs/specsys/` | evidence and template files |

<a id="required-records"></a>
## Required Records

Agents MUST create or update ADR/DDN/CCR/PER/Release/Exception records when task scope, public contracts, release behavior, operational behavior, test evidence, exceptions, or production admission criteria change.

<a id="stop-conditions"></a>
## Stop Conditions

Stop and request human approval when required evidence is missing, a public interface changes, a breaking change is requested, a secret appears, or a task requires production-impacting action not explicitly authorized.
