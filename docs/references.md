# Reference Index

<a id="toc"></a>
## Table of Contents

- [Normative Reference IDs](#normative-reference-ids)
- [Template Placement Rules](#template-placement-rules)
- [Evidence Mapping](#evidence-mapping)
- [Use Notes](#use-notes)

<a id="normative-reference-ids"></a>
## Normative Reference IDs

- [R01] NIST SP 800-218 Secure Software Development Framework (SSDF): https://csrc.nist.gov/Projects/ssdf
- [R02] SLSA v1.2 specification: https://slsa.dev/spec/v1.2/
- [R03] SPDX specifications and ISO/IEC 5962:2021 reference: https://spdx.dev/use/specifications/
- [R04] CycloneDX specification overview: https://cyclonedx.org/specification/overview/
- [R05] Python PEP 8 style guide: https://peps.python.org/pep-0008/
- [R06] Python PEP 257 docstring conventions: https://peps.python.org/pep-0257/
- [R07] Python PEP 387 backward compatibility policy: https://peps.python.org/pep-0387/
- [R08] Python C API stability / Stable ABI documentation: https://docs.python.org/3/c-api/stable.html
- [R09] PyPA pyproject.toml specification: https://packaging.python.org/en/latest/specifications/pyproject-toml/
- [R10] PyPA version specifiers specification: https://packaging.python.org/en/latest/specifications/version-specifiers/
- [R11] Haskell 2010 Language Report: https://www.haskell.org/onlinereport/haskell2010/
- [R12] GHC 9.14.1 User Guide: https://ghc.gitlab.haskell.org/ghc/doc/users_guide/9.14.1/
- [R13] Cabal package description / .cabal file user guide: https://cabal.readthedocs.io/en/stable/cabal-package-description-file.html
- [R14] Haskell Package Versioning Policy (PVP): https://pvp.haskell.org/
- [R15] LLVM Coding Standards: https://llvm.org/docs/CodingStandards.html
- [R16] LLVM Developer Policy: https://llvm.org/docs/DeveloperPolicy.html
- [R17] Clang C language support status: https://clang.llvm.org/c_status.html
- [R18] Clang C++ language support status: https://clang.llvm.org/cxx_status.html
- [R19] ISO WG14 C standards committee official page: https://www.open-std.org/jtc1/sc22/wg14/
- [R20] ISO WG21 C++ standards committee official page: https://isocpp.org/std/the-committee
- [R21] C++ Core Guidelines: https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines
- [R22] Erlang/OTP Design Principles: https://www.erlang.org/doc/system/design_principles.html
- [R23] Erlang/OTP External Term Format: https://www.erlang.org/doc/apps/erts/erl_ext_dist.html
- [R24] Erlang/OTP Release Handling: https://www.erlang.org/doc/system/release_handling.html
- [R25] Erlang/OTP appup cookbook: https://www.erlang.org/doc/system/appup_cookbook.html
- [R26] AGENTS.md open format for coding agents: https://agents.md/
- [R27] GitHub issue and pull request templates: https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/about-issue-and-pull-request-templates
- [R28] GitHub issue forms syntax: https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/syntax-for-issue-forms
- [R29] GitHub form schema syntax: https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/syntax-for-githubs-form-schema
- [R30] GitHub pull request template creation: https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/creating-a-pull-request-template-for-your-repository
- [R31] GitHub default community health files: https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file
- [R32] Conventional Commits 1.0.0: https://www.conventionalcommits.org/en/v1.0.0/

<a id="template-placement-rules"></a>
## Template Placement Rules

- GitHub issue forms live under `.github/ISSUE_TEMPLATE/*.yml`.
- GitHub pull request templates live under `.github/PULL_REQUEST_TEMPLATE/*.md` for multiple selectable templates.
- Canonical reusable templates live under `templates/` and are mirrored to subject-specific `.structs/` directories when agent routing needs a stable path.
- Operational evidence records live under `docs/` and release evidence lives under `release/`.

<a id="evidence-mapping"></a>
## Evidence Mapping

- ADR, DDN, CCR, PER, Release Record, Exception Record, and Evidence Index templates map to SSDF planning, design decision, vulnerability response, and evidence-preservation practices.
- SBOM placeholders map to SPDX and CycloneDX outputs.
- Provenance placeholders map to SLSA/in-toto style provenance evidence.
- GitHub issue and PR templates are enforcement intake records for code review, CI/CD, release approval, production admission, audit, and incident review.

<a id="use-notes"></a>
## Use Notes

Do not treat these templates as completed compliance evidence until all placeholder fields have been filled, reviewed, and linked from `docs/evidence-index.md`.
