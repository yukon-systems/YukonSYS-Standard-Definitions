---
template_id: YS-SPEC-SECURITY-CONTROLS-001
template_family: specsys
title: Security and Supply-Chain Controls
version: 0.1.0
status: draft
owner_role: security-engineering
applies_to:
  - secure-sdlc
  - supply-chain
  - api-token-handling
  - agentic-workers
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - NIST SSDF
  - SLSA v1.2
  - SPDX
  - CycloneDX
  - IETF RFC 6750
  - IETF RFC 9110
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

# Security and Supply-Chain Controls

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

Define cross-cutting controls for secure development, provenance, SBOMs, token/header handling, and operational safety.

<a id="when-to-use"></a>
## When to Use

- Adding dependencies
- Changing build/release automation
- Handling API tokens/headers
- Creating RAG pipelines or search integrations

<a id="when-not-to-use"></a>
## When Not to Use

- Do not store bearer tokens in examples or logs.
- Do not weaken TLS, authn/authz, input validation, or redaction.

<a id="required-inputs"></a>
## Required Inputs

- Target environment name and lifecycle stage: proof-of-concept, development, testing, burn-in, or production.
- Exact OS, architecture, toolchain, firmware, package, database, or appliance version as applicable.
- Approved issue, ADR, DDN, CCR, runbook, or change ticket.
- Backout owner, maintenance window, test plan, and acceptance criteria for operational changes.
- Redacted configuration values or parameter names. Do not request or echo secrets.

<a id="non-negotiable-agent-rules"></a>
## Non-Negotiable Agent Rules

- Use short-lived credentials and scoped tokens.
- Redact Authorization, Cookie, Set-Cookie, API keys, and session headers.
- Record SBOM and provenance for release artifacts.
- Pin dependencies and build environments.
- Perform security review for parsers, deserializers, shell execution, code generation, and network calls.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
curl -fsS -D <headers.out> --oauth2-bearer <redacted> <url>
openssl version -a
make sbom
make provenance
grep -R "Authorization:" .
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Token scope class, not token value
- TLS/version/cipher evidence where applicable
- SBOM/provenance file
- Security review link
- Redaction check output

<a id="validation"></a>
## Validation

- No secrets in repository.
- SBOM/provenance generated for release candidates.
- API examples use placeholders and explicit redaction.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Rotate exposed tokens immediately.
- Revoke affected sessions.
- Rollback dependency or build changes to last signed artifact.

<a id="references"></a>
## References

- https://www.rfc-editor.org/rfc/rfc6750
- https://www.rfc-editor.org/rfc/rfc9110
- https://csrc.nist.gov/pubs/sp/800/218/final
- https://slsa.dev/spec/v1.2/about

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
