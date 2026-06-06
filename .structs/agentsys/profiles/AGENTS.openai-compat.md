# AGENTS.md (OpenAI Compatibility Profile)

## 1. Authority and Scope

This file defines repository instructions for human-assisted and autonomous coding agents. It applies to all files under this directory unless a nested `AGENTS.md` provides stricter local instructions.

Agents must preserve the approved scope of the assigned task. Do not infer new features, change public contracts, weaken tests, change release behavior, or alter production-impacting configuration unless the task explicitly authorizes that change and cites an approved ADR, DDN, or CCR.

---

## 2. Non-Negotiable Controls

- Do not introduce hardcoded variable data. Use declared CLI options, configuration files, typed configuration schemas, or approved secret/config services.
- Do not change public API, ABI, CLI, configuration schema, serialized data format, database schema, or template semantics without a Compatibility Change Record.
- Do not change dependency pins, build provenance, release automation, deployment logic, production defaults, security controls, or migration behavior without human approval.
- Do not remove tests, lower thresholds, suppress warnings, or bypass validation gates.
- Do not expose secrets, credentials, customer data, internal tokens, or production configuration in prompts, logs, tests, or documentation.

---

## 3. Agent Workflow

1. Read this `AGENTS.md`, any nested `AGENTS.md` in affected paths, the issue or task, and the relevant design records.
2. Identify whether the change touches policy-sensitive areas: public interface, ABI, configuration, security, or production operations.
3. Implement the smallest scoped change that satisfies the task.
4. Add or update tests before considering the change complete.
5. Run the required validation commands, or state why a command could not be run.
6. Update evidence: docs, ADR/DDN/CCR/PER, release notes, migration notes, or compatibility records when applicable.
7. Produce the required final response format.

---

## 4. Protected Areas

Agent changes require explicit human approval when touching:
- CI/CD, deployment manifests, SBOM/provenance generation.
- Dependency lock files, package metadata, compiler/runtime version files.
- Public headers, database migrations, schema files, or protocol definitions.
- Security-sensitive code: authentication, cryptography, logging redaction.

---

## 5. Build, Test, and Validation

Validate changes using standard package manager or build commands:
* **Python:** `pytest` / `mypy` / `ruff`
* **Haskell:** `cabal build` / `cabal test`
* **C / C++:** `cmake` / `ctest`
* **Erlang:** `rebar3 compile` / `rebar3 eunit`

---

## 6. Required Final Response Format

Every task completion must conclude with the following response template:

```markdown
## Summary
- **Changes:** <brief description of changes>
- **Objective:** <why changes were made>

## Files Modified
- <filename>: <purpose of change>

## Validation Execution
- `command`: **PASS** | **FAIL** | **NOT RUN** (<reason>)

## Impact & Risk Assessment
* **API/ABI Changes:** None | Yes (Link to CCR/ADR Artifact)
* **Configuration Drift:** None | Yes (Link to schema/test updates)
* **Security Boundary:** None | Review Required
* **Known Risks:** <describe risks or "None known">
```
