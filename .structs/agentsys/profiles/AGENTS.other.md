# AGENTS.md (Generic Profile)

## 1. Authority and Scope

This file defines basic repository instructions for autonomous agents. It applies to all files under this directory.

---

## 2. General Controls

- Do not hardcode environment configuration, credentials, or model-specific parameters.
- Maintain public APIs, package structures, and contract definitions.
- Ensure formatting and build validation tools run successfully after changes.
- Ensure code changes are small, documented, and fully tested.

---

## 3. Workflow

1. Locate files requiring changes.
2. Formulate target line edits rather than overwriting whole files.
3. Validate editing results using the project's build and test suites.
4. Report changes and validation results in the final output.

---

## 4. Required Final Response

```markdown
## Summary
- **Changes:** <brief description of changes>
- **Objective:** <why changes were made>

## Files Modified
- <filename>: <purpose of change>

## Validation Execution
- `command`: **PASS** | **FAIL** | **NOT RUN**
```
