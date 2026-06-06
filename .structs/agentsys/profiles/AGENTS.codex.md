# AGENTS.md (Codex Profile)

## 1. Authority and Scope

This file defines repository instructions for human-assisted and autonomous coding agents. It applies to all files under this directory unless a nested `AGENTS.md` provides stricter local instructions. Nested instructions may add constraints, but must not weaken this file or the organization policy `CRMR-ENG-POL-001`.

Agents must preserve the approved scope of the assigned task. Do not infer new features, change public contracts, weaken tests, change release behavior, or alter production-impacting configuration unless the task explicitly authorizes that change and cites an approved ADR, DDN, or CCR.

---

## 2. Non-Negotiable Controls

- Do not introduce hardcoded variable data. Use declared CLI options, configuration files, typed configuration schemas, or approved secret/config services.
- Do not change public API, ABI, CLI, configuration schema, serialized data format, message contract, database schema, metric name, log schema, or template semantics without a Compatibility Change Record.
- Do not change dependency pins, build provenance, release automation, deployment logic, production defaults, security controls, or migration behavior without human approval.
- Do not remove tests, lower thresholds, suppress warnings, or bypass validation gates to make a change pass.
- Do not expose secrets, credentials, customer data, private incident data, internal tokens, or production configuration in prompts, logs, tests, fixtures, or documentation.
- Prefer minimal, reviewable diffs. Make documentation and tests change in the same patch as code when behavior changes.

---

## 3. Repository Map

Expected layout:
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
  templates/
  src/
  tests/
  ci/
  release/
  tools/
```

---

## 4. Agent Workflow

1. Read this `AGENTS.md`, any nested `AGENTS.md` in affected paths, the issue or task, and the relevant design records.
2. Identify whether the change touches policy-sensitive areas: public interface, ABI, configuration, data migration, release automation, security, dependency pins, templates, or production operations.
3. Implement the smallest scoped change that satisfies the task.
4. Add or update tests before considering the change complete.
5. Run the required validation commands listed below, or state why a command could not be run.
6. Update evidence: docs, ADR/DDN/CCR/PER, release notes, migration notes, or compatibility records when applicable.
7. Produce the required final response format in Section 12.

---

## 5. Protected Areas

Agent changes require explicit human approval when touching:
- `release/`, `ci/`, deployment manifests, admission controls, artifact signing, SBOM/provenance generation.
- Dependency lock files, package metadata, compiler/runtime version files, container base images, or toolchain manifests.
- Public headers, exported modules, public Python packages, Erlang message contracts, database migrations, schema files, or protocol definitions.
- Security-sensitive code: authentication, authorization, cryptography, secret handling, network boundary checks, sandboxing, deserialization, parsers, logging redaction.
- Production defaults, capacity controls, retry/backoff policies, timeout values, rate limits, feature flags, and resource limits.

---

## 6. Build, Test, and Evidence Commands

Replace placeholders with repository-specific commands. Agents must run commands relevant to modified files.

```sh
# General
make format-check
make lint
make test

# Python
python -m pip check
python -m pytest
python -m mypy src tests
python -m ruff check .

# Haskell
cabal update
cabal build all
cabal test all

# C/C++ with LLVM/Clang
cmake --build build
ctest --test-dir build --output-on-failure
clang-tidy -p build <changed-files>

# Erlang/OTP
rebar3 compile
rebar3 eunit
rebar3 ct
rebar3 dialyzer
```

If a command is unavailable, do not invent a result. State `not run`, the reason, and the risk.

---

## 7. Language-Specific Rules

### Python
- Follow PEP 8 and PEP 257 for public code and documentation.
- Use `pyproject.toml` for build metadata and tool configuration.
- Pin dependencies with a lock file or immutable resolver output.
- Keep public APIs compatible under PEP 387-style deprecation discipline.

### Haskell / GHC
- Declare `default-language` and all `default-extensions` explicitly in the `.cabal` file.
- Follow the Package Versioning Policy for public packages.
- Maintain explicit public module export lists.

### C / C++ with LLVM/Clang
- Declare an explicit `-std=` value per component.
- Keep builds warning-clean under approved warning flags.
- Prefer stable C ABI boundaries for cross-language or cross-version interfaces.

### Erlang/OTP
- Use OTP applications, behaviours, supervision trees, and releases for production services.
- Version message contracts and serialized term formats.
- Run EUnit, Common Test, and Dialyzer where applicable.

---

## 8. Configuration and Hardcoding Rules

Variable data belongs in configuration, not source code. This includes environment names, hostnames, ports, credentials, paths, tenants, regions, model names, feature flags, timeouts, retry counts, retention windows, and resource limits.

---

## 9. Documentation and Decision Records

Create or update records when behavior, scope, compatibility, or operations change:
- ADR: `docs/adr/ADR-YYYYMMDD-NNNN-slug.md`
- DDN: `docs/ddn/DDN-YYYYMMDD-NNNN-slug.md`
- CCR: `docs/ccr/CCR-YYYYMMDD-NNNN-slug.md`
- PER: `docs/per/PER-YYYYMMDD-NNNN-slug.md`

---

## 10. Security and Supply Chain Rules

- Use pinned, attestable build environments.
- Keep SBOM and provenance generation working for every release candidate.
- Do not add unaudited code generation, network downloads, shell execution, or deserialization paths without security review.

---

## 11. Stop Conditions

Stop and request human review when any condition applies:
- Requirements conflict or require interpretation that changes scope.
- A protected area must change.
- A public API/ABI/data/message/configuration contract must change.
- A secret, token, credential, private key, or production-only value appears.
- Required evidence cannot be produced.

---

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
