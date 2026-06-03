# Critical Resource Engineering Policy Expansion Repository

<a id="toc"></a>
## Table of Contents

- [Purpose](#purpose)
- [Repository Layout](#repository-layout)
- [Agent Entry Points](#agent-entry-points)
- [Subject Catalogs](#subject-catalogs)
- [Validation](#validation)
- [Change Control](#change-control)

<a id="purpose"></a>
## Purpose

This repository expansion adds routable standards for agentic workers supporting Critical Resource Management, Handling, and Response operations. It extends the baseline engineering policy with domain-specific operational rules for languages, operating systems, hardware, networking, infrastructure, validation, and compliance evidence.

<a id="repository-layout"></a>
## Repository Layout

```text
.structs/
  agentsys/   agent entry, routing, and per-agent augment controls
  langsys/    language and scripting standards
  opersys/    operating-system operator-language and command standards
  hwsys/      server, board, network, and infrastructure hardware standards
  specsys/    specification, evidence, and compliance definitions
scripts/      validation tooling
policy/       original generated policy artifacts
references/   uploaded compliance/source notes
```

<a id="agent-entry-points"></a>
## Agent Entry Points

- `.structs/agentsys/AGENTS.md`: populated from the repository root `AGENTS.md` baseline.
- `.structs/agentsys/AGENT_RULES.md`: workflow routing and stop conditions by subject area.
- `.structs/agentsys/AGENT_AUGMENTS.md`: per-agent control overlays for Codex, Web, OpenCode, Ollama, HuggingFace, webhook intake, and named manual agents.

<a id="subject-catalogs"></a>
## Subject Catalogs

Use these catalogs before producing or changing code, scripts, runbooks, infrastructure changes, or operational recommendations:

- `.structs/langsys/INDEX.md`
- `.structs/opersys/INDEX.md`
- `.structs/hwsys/INDEX.md`
- `.structs/specsys/INDEX.md`

<a id="validation"></a>
## Validation

Run the baseline validator before submitting changes:

```sh
scripts/validate-template-baseline.sh
```

The validator checks required metadata and policy sections across `.structs/**/*.md`.

<a id="change-control"></a>
## Change Control

Normative changes require a Compatibility Change Record when they alter public interface, ABI/API, command syntax, evidence requirements, lifecycle gates, rollback behavior, or agent authority.
