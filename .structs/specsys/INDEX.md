# Specification and Compliance Systems Index

<a id="toc"></a>
## Table of Contents

- [Purpose](#purpose)
- [Files](#files)
- [Use Rules](#use-rules)

<a id="purpose"></a>
## Purpose

`specsys` defines the compliance vocabulary, evidence schema, source-index rules, security controls, and template validation baseline used by all other catalogs.

<a id="files"></a>
## Files

| File | Purpose |
|---|---|
| `compliance-taxonomy.md` | Lifecycle, risk, control, and compatibility taxonomy. |
| `evidence-schema.md` | Required evidence fields for review and audit. |
| `source-index.md` | Primary source basis and reference classes. |
| `security-controls.md` | Security and supply-chain controls. |
| `template-validation.md` | Baseline metadata and section requirements. |

<a id="use-rules"></a>
## Use Rules

- Every standards file must include metadata, source basis, evidence, validation, and rollback sections.
- Every production-impacting recommendation must state applicable lifecycle stage and rollback model.
- Every externally sourced command or protocol claim must cite vendor, standards, or operating-system documentation.
