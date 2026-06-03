# AGENTS.md

<a id="toc"></a>
## Table of Contents

- [1. Authority and Scope](#authority-and-scope)
- [2. Non-Negotiable Controls](#non-negotiable-controls)
- [3. Repository Map](#repository-map)
- [4. Agent Workflow](#agent-workflow)
- [5. Protected Areas](#protected-areas)
- [6. Build, Test, and Evidence Commands](#build-test-and-evidence-commands)
- [7. Language-Specific Rules](#language-specific-rules)
- [8. Configuration and Hardcoding Rules](#configuration-and-hardcoding-rules)
- [9. Documentation and Decision Records](#documentation-and-decision-records)
- [10. Security and Supply Chain Rules](#security-and-supply-chain-rules)
- [11. Stop Conditions](#stop-conditions)
- [12. Required Final Response](#required-final-response)

<a id="authority-and-scope"></a>
## 1. Authority and Scope

This file defines repository instructions for human-assisted and autonomous coding agents. It applies to all files under this directory unless a nested `AGENTS.md` provides stricter local instructions. Nested instructions may add constraints, but must not weaken this file or the organization policy `CRMR-ENG-POL-001`.

Agents must preserve the approved scope of the assigned task. Do not infer new features, change public contracts, weaken tests, change release behavior, or alter production-impacting configuration unless the task explicitly authorizes that change and cites an approved ADR, DDN, or CCR.

<a id="non-negotiable-controls"></a>
## 2. Non-Negotiable Controls

- Do not introduce hardcoded variable data. Use declared CLI options, configuration files, typed configuration schemas, or approved secret/config services.
- Do not change public API, ABI, CLI, configuration schema, serialized data format, message contract, database schema, metric name, log schema, or template semantics without a Compatibility Change Record.
- Do not change dependency pins, build provenance, release automation, deployment logic, production defaults, security controls, or migration behavior without human approval.
- Do not remove tests, lower thresholds, suppress warnings, or bypass validation gates to make a change pass.
- Do not expose secrets, credentials, customer data, private incident data, internal tokens, or production configuration in prompts, logs, tests, fixtures, or documentation.
- Prefer minimal, reviewable diffs. Make documentation and tests change in the same patch as code when behavior changes.

<a id="repository-map"></a>
## 3. Repository Map

Expected layout. If this repository differs, preserve equivalent evidence and update this section.

```text
/
  AGENTS.md
  README.md
  docs/
    adr/
    ddn/
    ccr/
    per/
    runbooks/
  config/
    schemas/
    examples/
  templates/
  src/
  tests/
    unit/
    integration/
    contract/
    compatibility/
    performance/
  ci/
  release/
    sbom/
    provenance/
    records/
  tools/
```

<a id="agent-workflow"></a>
## 4. Agent Workflow

1. Read this `AGENTS.md`, any nested `AGENTS.md` in affected paths, the issue or task, and the relevant design records.
2. Identify whether the change touches policy-sensitive areas: public interface, ABI, configuration, data migration, release automation, security, dependency pins, templates, or production operations.
3. Implement the smallest scoped change that satisfies the task.
4. Add or update tests before considering the change complete.
5. Run the required validation commands listed below, or state why a command could not be run.
6. Update evidence: docs, ADR/DDN/CCR/PER, release notes, migration notes, or compatibility records when applicable.
7. Produce the required final response format in Section 12.

<a id="protected-areas"></a>
## 5. Protected Areas

Agent changes require explicit human approval when touching:

- `release/`, `ci/`, deployment manifests, admission controls, artifact signing, SBOM/provenance generation.
- Dependency lock files, package metadata, compiler/runtime version files, container base images, or toolchain manifests.
- Public headers, exported modules, public Python packages, Erlang message contracts, database migrations, schema files, or protocol definitions.
- Security-sensitive code: authentication, authorization, cryptography, secret handling, network boundary checks, sandboxing, deserialization, parsers, logging redaction.
- Production defaults, capacity controls, retry/backoff policies, timeout values, rate limits, feature flags, and resource limits.

<a id="build-test-and-evidence-commands"></a>
## 6. Build, Test, and Evidence Commands

Replace placeholders with repository-specific commands. Agents must run commands relevant to modified files.

```sh
# General
make format-check
make lint
make test
make test-contract
make test-compatibility
make test-performance-smoke
make sbom
make provenance

# Python
python -m pip check
python -m pytest
python -m mypy src tests
python -m ruff check .

# Haskell
cabal update
cabal build all
cabal test all
cabal haddock all

# C/C++ with LLVM/Clang
cmake --build build
ctest --test-dir build --output-on-failure
clang-tidy -p build <changed-files>
llvm-lit <test-dir>

# Erlang/OTP
rebar3 compile
rebar3 eunit
rebar3 ct
rebar3 dialyzer
```

If a command is unavailable, do not invent a result. State `not run`, the reason, and the risk.

<a id="language-specific-rules"></a>
## 7. Language-Specific Rules

### Python

- Follow PEP 8 and PEP 257 for public code and documentation.
- Use `pyproject.toml` for build metadata and tool configuration.
- Pin dependencies with a lock file or immutable resolver output.
- Keep public APIs compatible under PEP 387-style deprecation discipline.
- Use the Python Stable ABI / `abi3` for C extensions when cross-version binary compatibility is required.
- Use typed public interfaces and deterministic CLI/config parsing.

### Haskell / GHC

- Declare `default-language` and all `default-extensions` explicitly in the `.cabal` file.
- Use Haskell 2010 for portable modules unless GHC-specific behavior is approved and documented.
- Follow the Package Versioning Policy for public packages.
- Maintain explicit public module export lists.
- Document and test FFI boundaries and serialized data contracts.

### C / C++ with LLVM/Clang

- Declare an explicit `-std=` value per component.
- Keep builds warning-clean under approved warning flags.
- Do not rely on non-portable compiler extensions unless guarded, documented, and tested in the platform matrix.
- Run format, static analysis, sanitizer, and ABI/symbol checks when applicable.
- Prefer stable C ABI boundaries for cross-language or cross-version interfaces unless a C++ ABI policy is explicitly approved.

### Erlang/OTP

- Use OTP applications, behaviours, supervision trees, and releases for production services.
- Version message contracts and serialized term formats.
- Include `.appup` and release-handling evidence when hot or rolling upgrades require code/state migration.
- Run EUnit, Common Test, and Dialyzer where applicable.

<a id="configuration-and-hardcoding-rules"></a>
## 8. Configuration and Hardcoding Rules

Variable data belongs in configuration, not source code. This includes environment names, hostnames, ports, credentials, paths, tenants, regions, model names, resource limits, feature flags, timeouts, retry counts, retention windows, deployment targets, and hardware topology.

Any new configuration key must include:

- Schema entry and validation rule.
- Default value or explicit no-default marker.
- Description and allowed range.
- Security classification.
- Test coverage for valid, invalid, omitted, and boundary values.
- Documentation in the relevant example configuration.

<a id="documentation-and-decision-records"></a>
## 9. Documentation and Decision Records

Create or update records when behavior, scope, compatibility, or operations change:

- ADR: `docs/adr/ADR-YYYYMMDD-NNNN-slug.md`
- DDN: `docs/ddn/DDN-YYYYMMDD-NNNN-slug.md`
- CCR: `docs/ccr/CCR-YYYYMMDD-NNNN-slug.md`
- PER: `docs/per/PER-YYYYMMDD-NNNN-slug.md`
- Runbooks: `docs/runbooks/`

A scope change must include retrofit options, migration plan, backout plan, estimated implementation time, actual implementation time, variance, and approvals.

<a id="security-and-supply-chain-rules"></a>
## 10. Security and Supply Chain Rules

- Use pinned, attestable build environments.
- Keep SBOM and provenance generation working for every release candidate.
- Do not add unaudited code generation, network downloads, shell execution, or deserialization paths without security review.
- Do not weaken authentication, authorization, input validation, output encoding, secret handling, or logging redaction.
- Dependency updates require license, vulnerability, compatibility, and regression review.

<a id="stop-conditions"></a>
## 11. Stop Conditions

Stop and request human review when any condition applies:

- Requirements conflict or require interpretation that changes scope.
- A protected area must change.
- A public API/ABI/data/message/configuration contract must change.
- A secret, token, credential, private key, or production-only value appears.
- Required evidence cannot be produced.
- Tests fail for reasons unrelated to the requested change.
- The change could affect production operations, rollback, downgrade, incident response, or customer-visible behavior beyond the task.

<a id="required-final-response"></a>
## 12. Required Final Response

Use this structure for every completed agent task:

```markdown
## Summary
- <what changed>
- <why it changed>

## Files Changed
- `<path>`: <purpose>

## Validation
- `<command>`: pass | fail | not run (<reason>)

## Policy-Sensitive Impact
- API/ABI: none | changed, CCR: <link>
- Configuration: none | changed, schema/tests: <link>
- Security: none | changed, review: <link>
- Supply chain: none | changed, evidence: <link>
- Production operations: none | changed, runbook/release evidence: <link>

## Risks and Follow-Up
- <remaining risk or "none known">
```
