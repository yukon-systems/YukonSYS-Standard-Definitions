---
template_id: CRMR-TPL-COMMIT-STANDARD
template_family: git-standard
title: Commit Message Standard
version: 1.0.0
status: active
owner_role: Repository Maintainer
applies_to:
  - repository
  - service
  - release
classification: internal
source_basis: ["R32"]
review_cadence: per_release_train_or_quarterly
change_control: CCR_REQUIRED_FOR_PUBLIC_CONTRACT_CHANGE
---

<a id="toc"></a>
## Table of Contents

- [Syntax](#syntax)
- [Allowed Types](#allowed-types)
- [Breaking Changes](#breaking-changes)
- [Evidence Trailers](#evidence-trailers)

<a id="syntax"></a>
## Syntax

`<type>[optional scope]: <description>` followed by optional body and optional footers.

<a id="allowed-types"></a>
## Allowed Types

`feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`, `security`, `release`, `ops`.

<a id="breaking-changes"></a>
## Breaking Changes

Breaking changes MUST use `!` in the type/scope or a `BREAKING CHANGE:` footer and MUST link a CCR.

<a id="evidence-trailers"></a>
## Evidence Trailers

Use footers such as `Refs:`, `ADR:`, `DDN:`, `CCR:`, `PER:`, `Release-Record:`, and `Evidence-Index:`.
