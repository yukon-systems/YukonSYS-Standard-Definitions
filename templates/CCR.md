---
template_id: CRMR-TPL-CCR
template_family: compatibility-change-record
title: Compatibility Change Record
version: 1.0.0
status: active
owner_role: Architecture Owner
applies_to:
  - repository
  - service
  - release
classification: internal
source_basis: ["R01", "R07"]
review_cadence: per_release_train_or_quarterly
change_control: CCR_REQUIRED_FOR_PUBLIC_CONTRACT_CHANGE
---

<a id="toc"></a>
## Table of Contents

- [Public Interface Affected](#public-interface-affected)
- [Change Class](#change-class)
- [Compatibility Tests](#compatibility-tests)
- [Deprecation Start](#deprecation-start)
- [N-Cycle Removal Target](#n-cycle-removal-target)
- [Migration Guide](#migration-guide)
- [Adoption Telemetry](#adoption-telemetry)
- [Removal Approval](#removal-approval)

<a id="public-interface-affected"></a>
## Public Interface Affected

Name the API, ABI, CLI, configuration key, schema, database object, message, serialized format, metric, log field, template, or protocol affected.

<a id="change-class"></a>
## Change Class

`none | additive | backward-compatible behavior change | deprecation | breaking removal | emergency break-glass`

<a id="compatibility-tests"></a>
## Compatibility Tests

List contract, compatibility, downgrade, upgrade, rollback, and cross-version tests. Include command output links.

<a id="deprecation-start"></a>
## Deprecation Start

Version, release train, date, announcement channel, and documentation link.

<a id="n-cycle-removal-target"></a>
## N-Cycle Removal Target

Number of minor/major cycles before removal. Open-ended removal targets are prohibited.

<a id="migration-guide"></a>
## Migration Guide

Required action by users/operators, compatibility shims, feature flags, timeline, and fallback path.

<a id="adoption-telemetry"></a>
## Adoption Telemetry

Metrics, logs, traces, API counters, dependency graph, or support tickets used to measure migration progress.

<a id="removal-approval"></a>
## Removal Approval

Names, roles, approval date, remaining risk, and final compatibility test evidence.
