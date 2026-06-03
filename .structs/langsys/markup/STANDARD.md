---
template_id: YS-LANG-MARKUP-001
template_family: langsys
title: Markup Handling Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - LaTeX
  - BibTeX
  - Doxygen
  - Pandoc
  - Markdown
  - Org Mode
  - GitHub Markdown
  - AsciiDoc
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - LaTeX Project Documentation
  - BibTeX documentation
  - Doxygen Manual
  - Pandoc Manual
  - CommonMark
  - GitHub Flavored Markdown
  - Org Mode Manual
  - AsciiDoc documentation
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

# Markup Handling Standard

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

Define documentation, conversion, and markup-processing controls for referenceable, auditable engineering artifacts.

<a id="when-to-use"></a>
## When to Use

- Creating policy docs
- Generating docs from code
- Converting between markup formats
- Maintaining bibliographies and diagrams

<a id="when-not-to-use"></a>
## When Not to Use

- Do not use generated docs as source of truth unless the generator and input manifest are captured.
- Do not allow raw untrusted HTML or unsafe includes in rendered docs.

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
- Use stable anchors and a referenceable table of contents.
- Keep source format canonical and generated formats reproducible.
- Pin Pandoc/Doxygen/LaTeX toolchains for release artifacts.
- Validate links, anchors, examples, citations, and diagrams.
- Document unsupported conversion losses.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
pandoc --version
doxygen --version
latex --version
bibtex --version
markdownlint <files>
asciidoctor --version
emacs --batch --eval "(princ org-version)"
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Canonical source file
- Generated artifacts
- Tool versions
- Broken-link report
- Anchor report
- Bibliography/citation check

<a id="validation"></a>
## Validation

- All internal anchors resolve.
- No broken links.
- Generated artifacts are reproducible from source.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Restore previous canonical source.
- Regenerate artifacts with previous pinned toolchain.
- Remove generated docs from release if validation fails.

<a id="references"></a>
## References

- https://www.latex-project.org/help/documentation/
- https://www.doxygen.nl/manual/docblocks.html
- https://pandoc.org/MANUAL.html
- https://spec.commonmark.org/
- https://github.github.com/gfm/
- https://orgmode.org/manual/
- https://docs.asciidoctor.org/asciidoc/latest/

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
