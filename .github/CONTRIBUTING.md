# Contributing

<a id="toc"></a>
## Table of Contents

- [Required Intake](#required-intake)
- [Commit Messages](#commit-messages)
- [Evidence Requirements](#evidence-requirements)
- [Review Gates](#review-gates)

<a id="required-intake"></a>
## Required Intake

Use the matching GitHub issue form and pull request template. Do not bypass required fields by opening blank issues.

<a id="commit-messages"></a>
## Commit Messages

Use Conventional Commits syntax:

```text
<type>[optional scope]: <description>

[optional body]
[optional footer(s)]
```

Breaking changes MUST use `!` in the type/scope or a `BREAKING CHANGE:` footer and MUST link a CCR.

<a id="evidence-requirements"></a>
## Evidence Requirements

All changes must update the policy evidence index when they touch code, configuration, public contracts, release behavior, operational runbooks, security controls, supply-chain metadata, or production admission criteria.

<a id="review-gates"></a>
## Review Gates

Architecture, Security, Verification, and Operations reviews are required when a change affects their control domains.
