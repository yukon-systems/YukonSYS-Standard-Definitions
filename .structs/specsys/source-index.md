---
template_id: YS-SPEC-SOURCE-INDEX-001
template_family: specsys
title: Source Index and Reference Classes
version: 0.1.0
status: draft
owner_role: documentation-architecture
applies_to:
  - all-standards-files
source_basis:
  - official standards bodies
  - vendor documentation
  - operating-system documentation
classification: internal
required_fields:
  - source_class
  - applicability
  - freshness_rule
  - evidence_required
validation_rules:
  - official source preferred over community source
  - deprecated or frozen documentation must be marked
review_cadence: 90 days
last_reviewed: 2026-06-03
change_control: CCR required for source-priority changes
---

# Source Index and Reference Classes

<a id="purpose"></a>
## Purpose

Define source priority, freshness rules, and canonical reference classes for standards-catalog entries.

## Source Priority

1. Ratified standards body specifications: ISO, IETF RFC, The Open Group, DMTF, UEFI Forum, NIST, SLSA, SPDX, CycloneDX.
2. Official vendor documentation: Red Hat, Debian, Oracle, FreeBSD, MikroTik, Arista, NVIDIA, Raspberry Pi, Turing Pi, Dell, HPE, Supermicro, Intel.
3. Official project documentation: OpenWrt, VyOS, OPNsense, OpenBMC, U-Boot, OpenSSH, OpenSSL, Jenkins, Slurm.
4. Distribution man pages and package docs from the target host.
5. Community or historical sources only when marked non-authoritative and reviewed.

## Freshness Rule

- Operating systems, appliances, firmware, security, network protocols, and package managers require current source verification before production use.
- Historical or frozen documentation may be used only for legacy systems and must be labeled as such.
- If a product version cannot be verified from official sources, require local attestation: command output, package manifest, vendor portal export, or signed release artifact.

## Canonical References Used by This Pack

| Area | Reference |
|---|---|
| Secure SDLC | https://csrc.nist.gov/pubs/sp/800/218/final |
| Supply-chain hardening | https://slsa.dev/spec/v1.2/about |
| SBOM SPDX | https://spdx.dev/use/specifications/ |
| SBOM CycloneDX | https://cyclonedx.org/specification/overview/ |
| POSIX | https://pubs.opengroup.org/onlinepubs/9799919799/ |
| Bash | https://www.gnu.org/software/bash/manual/bash.html |
| Lua | https://www.lua.org/manual/5.4/ |
| Common Lisp | https://www.lispworks.com/documentation/HyperSpec/Front/ |
| MySQL | https://dev.mysql.com/doc/refman/8.4/en/create-procedure.html |
| Percona | https://docs.percona.com/percona-server/8.4/ |
| Oracle SQL | https://docs.oracle.com/en/database/oracle/oracle-database/ |
| PostgreSQL | https://www.postgresql.org/docs/current/ |
| ISO SQL | https://www.iso.org/standard/76583.html |
| Jenkins Pipeline | https://www.jenkins.io/doc/book/pipeline/syntax/ |
| Slurm | https://slurm.schedmd.com/sbatch.html |
| RouterOS/SwOS | https://help.mikrotik.com/docs/ |
| OPNsense | https://docs.opnsense.org/ |
| Arista EOS | https://www.arista.com/en/um-eos/eos-overview |
| VyOS | https://docs.vyos.io/en/rolling/ |
| Redfish | https://www.dmtf.org/standards/redfish |
| U-Boot | https://docs.u-boot.org/en/latest/ |
| UEFI | https://uefi.org/specifications |
| NVIDIA Jetson | https://docs.nvidia.com/jetson/ |
| Raspberry Pi | https://www.raspberrypi.com/documentation/ |

<a id="evidence-required"></a>
## Evidence Required

- Source URL, title, publication or release date when available.
- Source class: standards body, official vendor, official project, distribution man page, or community/historical.
- Applicability note for target version, OS, architecture, firmware, or lifecycle stage.
- Freshness decision and any local attestation used when public documentation is incomplete.

<a id="validation"></a>
## Validation

- Prefer official standards-body, vendor, or project documentation over community sources.
- Mark frozen, legacy, deprecated, or unverified documentation explicitly.
- Require local command output or signed vendor artifact when exact version cannot be verified publicly.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- Revert source-priority changes to the prior reviewed revision.
- Restore previous canonical reference mappings if a source is later found stale or incorrect.
- Record correction in change history and affected standards files.

<a id="references"></a>
## References

- `references/github-templates-compliance.md`
- Official standards, vendor, and project references listed in this source index.

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial source-index standard.
