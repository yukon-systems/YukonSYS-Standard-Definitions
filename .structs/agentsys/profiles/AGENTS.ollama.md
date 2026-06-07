# AGENTS.md (Ollama Local/Offline Profile)

## 1. Authority and Scope

This file defines offline repository instructions for local agents (e.g., running via Ollama). It applies to all files under this directory unless a nested `AGENTS.md` provides stricter local instructions.

---

## 2. Strict Offline Controls

> [!WARNING]
> **No Remote / Network Access**
> * Do not initiate network connections, outbound web requests, or external downloads.
> * Do not download packages, runtimes, base images, or library dependencies.
> * All package operations must use local caches (`--no-index` / offline modes).
> * Do not send code, telemetry, prompts, or configuration data to remote endpoints.

---

## 3. Local Non-Negotiable Controls

- Do not introduce hardcoded credentials, secret values, local paths, or ports.
- Preserve public interfaces, contracts, templates, and schemas exactly as defined.
- Do not bypass local build compilation checks or unit tests.
- Prefer minimal, highly readable, localized changes.

---

## 4. Agent Workflow

1. Read this `AGENTS.md` and check local project files.
2. Verify all compilation, building, formatting, and linting requirements locally.
3. Apply localized fixes using standard editing tools.
4. Execute unit tests locally using your command tool.
5. Provide a summary of the local run status.

---

## 5. Build, Test, and Validation (Local-Only)

Run offline validation tools:
* **Python:** `ruff check .` && `python -m pytest`
* **Haskell:** `cabal build` && `cabal test`
* **C / C++:** `cmake --build build` && `ctest`
* **Erlang:** `rebar3 compile` && `rebar3 eunit`

---

## 6. Required Final Response Format

Every task completion must conclude with the following response template:

```markdown
## Summary
- **Changes:** <brief description of changes>
- **Objective:** <why changes were made>

## Files Modified
- <filename>: <purpose of change>

## Validation Execution (Local)
- `command`: **PASS** | **FAIL** | **NOT RUN** (Offline limitations)

## Impact & Risk Assessment
* **API/ABI Changes:** None | Yes
* **Configuration Drift:** None | Yes
* **Security Boundary:** None | Review Required
```
