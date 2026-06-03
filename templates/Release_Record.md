---
template_id: CRMR-TPL-RELEASE-RECORD
template_family: release-record
title: Release Record
version: 1.0.0
status: active
owner_role: Release Manager
applies_to:
  - repository
  - service
  - release
classification: internal
source_basis: ["R01", "R02", "R03", "R04"]
review_cadence: per_release_train_or_quarterly
change_control: CCR_REQUIRED_FOR_PUBLIC_CONTRACT_CHANGE
---

<a id="toc"></a>
## Table of Contents

- [Commit](#commit)
- [Artifact Digest](#artifact-digest)
- [SBOM](#sbom)
- [Provenance](#provenance)
- [Toolchain](#toolchain)
- [Dependency Locks](#dependency-locks)
- [Configuration Fingerprint](#configuration-fingerprint)
- [Tests](#tests)
- [Deployment Strategy](#deployment-strategy)
- [Rollback Evidence](#rollback-evidence)
- [Approvals](#approvals)

<a id="commit"></a>
## Commit

Release commit SHA, tag, branch, signed commit verification, and source repository URL.

<a id="artifact-digest"></a>
## Artifact Digest

List artifact names, immutable digests, package registry locations, container digests, firmware image digests, or archive hashes.

<a id="sbom"></a>
## SBOM

Link SPDX and/or CycloneDX SBOM files under `release/sbom/`. Include generation command and tool version.

<a id="provenance"></a>
## Provenance

Link SLSA/in-toto provenance under `release/provenance/`. Include builder identity, source ref, and predicate type.

<a id="toolchain"></a>
## Toolchain

Compiler, interpreter, runtime, linker, package manager, build system, OS image, and container base image pins.

<a id="dependency-locks"></a>
## Dependency Locks

Lock file paths, package digests, vendored dependency hashes, vulnerability scan evidence, and license review.

<a id="configuration-fingerprint"></a>
## Configuration Fingerprint

Configuration schema version, example config digest, feature flag state, secret reference IDs, and environment-specific overrides.

<a id="tests"></a>
## Tests

Unit, integration, contract, compatibility, performance, security, upgrade, rollback, and smoke tests with links to reports.

<a id="deployment-strategy"></a>
## Deployment Strategy

Deployment type, rollout stages, canary criteria, admission controls, maintenance windows, and operator communications.

<a id="rollback-evidence"></a>
## Rollback Evidence

Rollback command/plan, downgrade compatibility test, backup/restore evidence, and final abort criteria.

<a id="approvals"></a>
## Approvals

- Architecture:
- Security:
- Verification:
- Operations:
- Release manager:
- Business/mission owner:
