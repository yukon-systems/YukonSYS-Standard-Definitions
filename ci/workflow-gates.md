---
template_id: CRMR-TPL-CI-GATES
template_family: ci
title: CI/CD Gate Record
version: 1.0.0
status: active
owner_role: Verification Lead
applies_to:
  - repository
  - service
  - release
classification: internal
source_basis: ["R01", "R02"]
review_cadence: per_release_train_or_quarterly
change_control: CCR_REQUIRED_FOR_PUBLIC_CONTRACT_CHANGE
---

<a id="toc"></a>
## Table of Contents

- [Required Gates](#required-gates)
- [Admission Rules](#admission-rules)
- [Failure Handling](#failure-handling)

<a id="required-gates"></a>
## Required Gates

- format
- lint
- unit
- integration
- contract
- compatibility
- performance smoke
- SBOM
- provenance

<a id="admission-rules"></a>
## Admission Rules

No merge or release may proceed with missing required evidence unless an approved, unexpired exception is linked.

<a id="failure-handling"></a>
## Failure Handling

Failures must link to issue, owner, remediation, and retest evidence.
