# YukonSYS Repository Template Policy

## Purpose

This policy keeps new YukonSYS repositories consistent with the shared agent,
coding, review, security, and GitHub operating baselines in the
`yukon-systems/YukonSYS-Standard-Definitions` template repository.

## Policy

All new YukonSYS repositories MUST be created from the GitHub template
repository:

```text
yukon-systems/YukonSYS-Standard-Definitions
```

A repository created without this template is non-compliant until it has passed
the retrofit procedure below and the retrofit evidence is recorded in the
repository pull request, issue, or migration log.

## Required Creation Paths

Use one of these approved creation paths:

1. GitHub UI: select `Use this template` from
   `https://github.com/yukon-systems/YukonSYS-Standard-Definitions`.
2. GitHub CLI:

   ```sh
   gh repo create yukon-systems/<repo-name> \
     --private \
     --template yukon-systems/YukonSYS-Standard-Definitions \
     --clone
   ```

Public or internal visibility MAY replace `--private` when the repository owner
explicitly approves that visibility before creation.

Do not use `gh repo create --source`, an empty GitHub repository, or an import
from local files as the initial creation path unless an exception is approved
before creation.

## Required Baseline Artifacts

A compliant repository MUST retain or intentionally supersede these template
artifacts:

```text
AGENTS.md
SECURITY.md
.gitattributes
.gitignore
.github/ISSUE_TEMPLATE/
.github/PULL_REQUEST_TEMPLATE/
.structs/
```

If a repository replaces a baseline artifact, the replacement MUST preserve the
same requirement intent and cite the local reason for divergence.

## Existing Non-Template Repository Retrofit

For existing repositories that were not created from the template, prefer a
retrofit over destructive restart when useful migration work already exists.
The retrofit MUST:

1. Copy the current `master` template baseline into the repository without
   deleting domain-specific work.
2. Resolve file conflicts explicitly, preserving stricter local requirements
   when they do not weaken the YukonSYS baseline.
3. Run a full repository audit for required baseline artifacts, stale path
   references, GitHub templates, agent rules, coding standards, secrets safety,
   and migration-specific acceptance criteria.
4. Record validation evidence in the pull request or migration log.

A restart with a newly created compliant repository SHOULD be reserved for cases
where the existing repository history or layout is cheaper to discard than to
audit. Before any restart, rename or archive the existing repository so no
migration work is lost.

## Exceptions

Exceptions require an explicit written reason in the issue, pull request, or
migration log before repository creation or retrofit. The exception record MUST
include:

- why the template path cannot be used;
- which baseline artifacts will be copied or replaced;
- who owns the follow-up retrofit;
- the target date or blocking condition for returning to compliance.

## Verification

Before declaring a repository standards-compliant, verify:

```sh
find AGENTS.md SECURITY.md .gitattributes .gitignore .github .structs -maxdepth 1 -print
```

For this template repository, run:

```sh
scripts/validate-template-baseline.sh
```

## Source Basis

- GitHub Docs: https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template
- GitHub Docs: https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository
- GitHub CLI: https://cli.github.com/manual/gh_repo_create
- YukonSYS GitHub Templates Compliance Standard.
