---
template_id: CRMR-TPL-PER
template_family: performance-evaluation-record
title: Performance Evaluation Record
version: 1.0.0
status: active
owner_role: Verification Lead
applies_to:
  - repository
  - service
  - release
classification: internal
source_basis: ["R01"]
review_cadence: per_release_train_or_quarterly
change_control: CCR_REQUIRED_FOR_PUBLIC_CONTRACT_CHANGE
---

<a id="toc"></a>
## Table of Contents

- [Workload](#workload)
- [Tool Versions](#tool-versions)
- [Environment](#environment)
- [Baseline](#baseline)
- [Target](#target)
- [Results](#results)
- [Saturation Points](#saturation-points)
- [Regression Explanation](#regression-explanation)
- [Approval](#approval)

<a id="workload"></a>
## Workload

Describe workload, input data, traffic model, concurrency, batch size, duration, warm-up, and steady-state criteria.

<a id="tool-versions"></a>
## Tool Versions

List exact tool versions, commands, compiler/runtime versions, firmware/OS versions, and container/package digests.

<a id="environment"></a>
## Environment

Hardware, CPU, memory, storage, network, topology, OS, kernel, scheduler, DB versions, config fingerprint, and isolation assumptions.

<a id="baseline"></a>
## Baseline

Baseline version, commit, artifact digest, expected behavior, baseline measurements, and evidence link.

<a id="target"></a>
## Target

Target version, commit, artifact digest, expected improvement or maximum allowed regression.

<a id="results"></a>
## Results

Provide tables or links for throughput, latency percentiles, error rates, resource consumption, and repeatability.

<a id="saturation-points"></a>
## Saturation Points

Identify CPU, memory, I/O, network, queue, lock, database, GPU, or external service saturation thresholds.

<a id="regression-explanation"></a>
## Regression Explanation

Explain any regression, variance, or non-determinism. Link DDN or CCR if scope or compatibility changed.

<a id="approval"></a>
## Approval

- Verification:
- Operations:
- Architecture:
- Release manager:
