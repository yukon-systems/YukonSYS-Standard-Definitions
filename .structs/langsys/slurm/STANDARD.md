---
template_id: YS-LANG-SLURM-001
template_family: langsys
title: SLURM Scripting Standard
version: 0.1.0
status: draft
owner_role: platform-engineering
applies_to:
  - Slurm
  - sbatch
  - srun
  - salloc
  - HPC jobs
audience:
  - agentic-workers
  - platform-engineers
  - reviewers
source_basis:
  - Slurm sbatch Documentation
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

# SLURM Scripting Standard

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

Define Slurm job-script controls for HPC batch, burn-in, regression, and performance workflows.

<a id="when-to-use"></a>
## When to Use

- Writing `sbatch` scripts
- Running burn-in/performance tests
- Submitting reproducible HPC workloads

<a id="when-not-to-use"></a>
## When Not to Use

- Do not submit jobs to production partitions without allocation, QoS, and change approval.
- Do not hardcode node names, partitions, accounts, or paths unless declared configuration parameters.

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
- Declare job name, account, partition, time, nodes, tasks, CPUs, memory, GPUs, and output/error paths explicitly.
- Use module/container/environment capture for reproducibility.
- Separate setup, execution, teardown, and artifact copy.
- Capture `scontrol show job` and scheduler resource evidence.

<a id="command-or-interface-surface"></a>
## Command or Interface Surface

```text
sbatch --test-only <script>
scontrol show config
scontrol show partition
sinfo
squeue -j <jobid>
sacct -j <jobid> --format=JobID,State,ExitCode,Elapsed,MaxRSS
```

Commands are descriptive controls, not authorization. Run only in the approved environment and only after read-only discovery confirms target identity.

<a id="evidence-required"></a>
## Evidence Required

- Slurm version/config snapshot
- Job script
- Allocation/QoS
- Resource request and actual usage
- Exit codes
- Logs/artifacts

<a id="validation"></a>
## Validation

- `sbatch --test-only` succeeds.
- Resource requests match approved test plan.
- Job exits with documented code.

<a id="rollback-or-backout"></a>
## Rollback or Backout

- scancel <jobid>
- Drain/undrain only with admin approval.
- Restore previous job script and resource profile.

<a id="references"></a>
## References

- https://slurm.schedmd.com/sbatch.html

<a id="version-history"></a>
## Version History

- 0.1.0 (2026-06-03): Initial standards-catalog entry generated for Critical Resource Management, Handling, and Response policy expansion.
