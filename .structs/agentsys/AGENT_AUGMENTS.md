---
template_id: YS-AGENT-AUGMENTS-001
template_family: agentsys
title: Agent-Specific Operating Augments
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - OpenAI Codex
  - OpenAI Web
  - OpenCode
  - Ollama agent
  - HuggingFace agent
  - Slack/Webhook directed agentic controls
  - LTC Forge
  - LtCol Forge
  - Atlas
  - Hammer
  - Ruiner
  - Forge{1..N}
source_basis:
  - root AGENTS.md
  - .structs/agentsys/AGENT_RULES.md
classification: internal
required_fields:
  - purpose
  - operating_limits
  - action_sequence
  - evidence_required
validation_rules:
  - all agent augments must be stricter than root AGENTS.md
  - webhook agents are intake-only unless separately authorized
review_cadence: 90 days
last_reviewed: 2026-06-03
change_control: CCR required for authority expansion
---

# Agent-Specific Operating Augments

<a id="toc"></a>
## Table of Contents

- [Purpose](#purpose)
- [Universal Agent Limits](#universal-agent-limits)
- [OpenAI Codex](#openai-codex)
- [OpenAI Web](#openai-web)
- [OpenCode](#opencode)
- [Ollama Agent](#ollama-agent)
- [HuggingFace Agent](#huggingface-agent)
- [Slack / Webhook Directed Agent](#slack--webhook-directed-agent)
- [Named Manual Agents](#named-manual-agents)
- [Evidence Required](#evidence-required)
- [Validation](#validation)
- [Rollback or Backout](#rollback-or-backout)
- [References](#references)
- [Placeholders for Future Controls](#placeholders-for-future-controls)
- [Version History](#version-history)

<a id="purpose"></a>
## Purpose

Define control overlays for different agent types so that work is routed to the correct subject catalog and performed with explicit authority, limitations, evidence requirements, and stop conditions.

<a id="universal-agent-limits"></a>
## Universal Agent Limits

- Do not request, echo, transform, store, or invent secrets.
- Do not perform production-impacting commands without explicit human approval.
- Do not make destructive changes without a documented backout path.
- Do not bypass validation because a task appears urgent.
- Do not treat generated commands as approved execution.
- Always cite or link source basis for operating-system, vendor, firmware, network, security, and standards claims.
- Always prefer read-only discovery before proposing write operations.

<a id="openai-codex"></a>
## OpenAI Codex

**Authorized use:** repository-local code generation, refactoring, tests, validation scripts, documentation updates, and static-analysis remediation.

**Limits:** no production shell access, no unaudited network downloads, no secret handling, no dependency upgrades without approval, no release or deployment changes without CCR/approval.

**Action sequence:** read `AGENT_RULES.md`, read impacted subject standards, inspect relevant files, patch minimally, add tests, run validation, report exact commands and results.

**Evidence:** diff summary, files changed, tests run, commands not run, policy-sensitive impact table.

<a id="openai-web"></a>
## OpenAI Web

**Authorized use:** source discovery, standards verification, vendor-document comparison, version freshness checks, citation gathering, and non-executing research.

**Limits:** no command execution, no private credential handling, no assumptions from stale vendor pages, no use of forums as primary authority when official docs are available.

**Action sequence:** search official/vendor/standards sources first, compare dates and release state, summarize applicability, identify unsupported or deprecated areas, cite all load-bearing claims.

<a id="opencode"></a>
## OpenCode

**Authorized use:** local repository edit workflows comparable to Codex, including patch generation and local tests.

**Limits:** no production environment mutation; no package manager, firmware, network, or database write commands unless explicitly scoped to a sandbox.

**Action sequence:** use Codex sequence plus an explicit sandbox declaration for every command.

<a id="ollama-agent"></a>
## Ollama Agent

**Authorized use:** local-only inference for drafting, summarization, classification, and non-sensitive code assistance.

**Limits:** treat model outputs as untrusted; do not provide secrets; do not rely on model memory for facts; do not allow direct shell execution unless wrapped by a reviewed harness.

**Action sequence:** provide redacted inputs, require deterministic prompts, require human review for any generated operational command.

<a id="huggingface-agent"></a>
## HuggingFace Agent

**Authorized use:** model, dataset, and RAG-pipeline assistance where licenses, model cards, and data classifications are reviewed.

**Limits:** no uploading proprietary data to public endpoints; no unreviewed model execution against sensitive documents; no automated dependency installs without lockfiles.

**Action sequence:** verify model/dataset license, card, checksum or revision, intended task, data classification, evaluation method, and reproducibility evidence.

<a id="slack--webhook-directed-agent"></a>
## Slack / Webhook Directed Agent

**Authorized use:** intake, acknowledgement, ticket creation, routing, and status reply only.

**Limits:** no direct production changes, no secrets in messages, no command execution from chat text, no privileged action from unauthenticated webhooks, no escalation based solely on unverified identity.

**Action sequence:** verify sender authorization, classify request, create/append ticket, route to correct subject catalog, require human approval for execution.

<a id="named-manual-agents"></a>
## Named Manual Agents

| Agent Name | Role | Authority Boundary |
|---|---|---|
| `LTC Forge` / `LtCol Forge` | Senior policy and compliance synthesis | May draft standards and change records; may not execute production changes. |
| `Atlas` | Catalog mapping, inventory, dependency graphing, source indexing | Read-only discovery unless change ticket grants write access. |
| `Hammer` | Validation, CI evidence, tests, lint, baseline enforcement | May run approved validation; may not suppress gates. |
| `Ruiner` | Destructive-change analysis, failure-mode simulation, backout planning | Dry-run and simulation only unless explicit break-glass approval exists. |
| `Forge{1..N}` | Scaled standards workers by domain | Must declare assigned domain and read routed standards before work. |

<a id="evidence-required"></a>
## Evidence Required

- Agent type or manually assigned agent name.
- Routed subject standards read before action.
- Authority boundary applied.
- Commands proposed, commands run, and commands explicitly not run.
- Validation output and backout path.

<a id="validation"></a>
## Validation

- Confirm every augment is stricter than or equal to root `AGENTS.md`.
- Confirm webhook-directed agents remain intake-only unless a separate authorization record exists.
- Confirm named-agent authority does not bypass subject standards or human approvals.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Restore the prior `.structs/agentsys/AGENT_AUGMENTS.md` revision.
- Re-run baseline validation.
- Revoke any newly introduced authority until CCR review completes.

<a id="references"></a>
## References

- root `AGENTS.md`
- `.structs/agentsys/AGENT_RULES.md`
- `references/github-templates-compliance.md`

<a id="placeholders-for-future-controls"></a>
## Placeholders for Future Controls

- `agent.identity.assurance`: pending organizational identity provider integration.
- `agent.command.broker`: pending policy-enforced command execution gateway.
- `agent.evidence.notary`: pending provenance-backed result attestation.
- `agent.secrets.firewall`: pending automatic redaction and DLP layer.

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial agent augment structure.
