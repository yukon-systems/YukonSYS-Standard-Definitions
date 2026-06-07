# Agent Augments

<a id="toc"></a>
## Table of Contents

- [Purpose](#purpose)
- [Gemini Developer](#gemini-developer)
- [Gemini Search](#gemini-search)
- [OpenCode](#opencode)
- [Ollama Agent](#ollama-agent)
- [HuggingFace Agent](#huggingface-agent)
- [Slack / Webhook Directed Agent](#slack--webhook-directed-agent)
- [Named Manual Agents](#named-manual-agents)

<a id="purpose"></a>
## Purpose

Define per-agent operating overlays. All agents remain bound by root `AGENTS.md`, `.structs/agentsys/AGENT_RULES.md`, and policy record requirements.

<a id="gemini-developer"></a>
## Gemini Developer

- MAY edit code, tests, documentation, and templates inside the authorized task scope.
- MUST update `docs/evidence-index.md` when touching policy-sensitive areas.
- MUST use the smallest reviewable diff.
- MUST NOT bypass failing tests, lower thresholds, or remove evidence gates.

<a id="gemini-search"></a>
## Gemini Search

- MAY gather public documentation and summarize source basis.
- MUST cite official or primary sources for standards claims.
- MUST NOT perform production actions or claim local validation without evidence.

<a id="opencode"></a>
## OpenCode

- MAY perform local repository edits and validation commands.
- MUST use templates under `templates/` or `.structs/` for generated records.
- MUST record unavailable commands as `not run` with reason and risk.

<a id="ollama-agent"></a>
## Ollama Agent

- MAY perform offline drafting, local linting, and local analysis.
- MUST NOT infer current external facts without a provided source bundle.
- MUST NOT handle secrets unless explicitly configured in an approved local secure workflow.

<a id="huggingface-agent"></a>
## HuggingFace Agent

- MAY process local datasets for classification, extraction, and summarization.
- MUST preserve source document IDs, chunk IDs, model IDs, embedding model versions, and index fingerprints for RAG evidence.
- MUST NOT send restricted data to public endpoints.

<a id="slack--webhook-directed-agent"></a>
## Slack / Webhook Directed Agent

- Intake only by default.
- MAY classify, acknowledge, and route messages.
- MUST require authorization before creating tickets, changing repository content, invoking tools, or sending external responses.
- MUST redact secrets and escalate suspected credential exposure.

<a id="named-manual-agents"></a>
## Named Manual Agents

Manual names such as `LTC Forge`, `LtCol Forge`, `Atlas`, `Hammer`, `Ruiner`, and `Forge{1..N}` are aliases for human-approved operating roles. Each named agent MUST have an owner, scope, authorization level, and audit trail before being used in automation.
