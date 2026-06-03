# YukonSYS Standards Template Overlay

<a id="toc"></a>
## Table of Contents

- [Purpose](#purpose)
- [How to Apply](#how-to-apply)
- [Appendix A Minimum Repository Structure](#appendix-a-minimum-repository-structure)
- [Required Record Templates](#required-record-templates)
- [GitHub Operational Templates](#github-operational-templates)
- [Validation](#validation)
- [Source Basis](#source-basis)

<a id="purpose"></a>
## Purpose

This overlay supplies the repository skeleton and required templates for Critical Resource Management, Handling, and Response engineering operations. It is intended to be extracted at the root of `yukon-systems/YukonSYS-Standard-Definitions` or any repository adopting `CRMR-ENG-POL-001`.

<a id="how-to-apply"></a>
## How to Apply

```sh
# from repository root
tar -xzf YukonSYS-Standard-Definitions_template_overlay.tar.gz
# or
unzip YukonSYS-Standard-Definitions_template_overlay.zip

# validate
./scripts/validate-template-baseline.sh .
python3 tools/validate-evidence-index.py docs/evidence-index.yaml
```

Do not overwrite existing completed records without review. If a file already exists, compare and merge the template additions.

<a id="appendix-a-minimum-repository-structure"></a>
## Appendix A Minimum Repository Structure

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

This overlay also adds `.github/`, `.structs/`, `references/`, `docs/exceptions/`, `docs/test-reports/`, and other support directories required for GitHub intake, agent routing, and compliance evidence.

<a id="required-record-templates"></a>
## Required Record Templates

- `docs/adr/ADR-TEMPLATE.md` and `templates/ADR.md`
- `docs/ddn/DDN-TEMPLATE.md` and `templates/DDN.md`
- `docs/ccr/CCR-TEMPLATE.md` and `templates/CCR.md`
- `docs/per/PER-TEMPLATE.md` and `templates/PER.md`
- `release/records/RELEASE-RECORD-TEMPLATE.md` and `templates/Release_Record.md`
- `docs/exceptions/EXCEPTION-TEMPLATE.md` and `templates/Exception_Record.md`
- `docs/evidence-index.md` and `docs/evidence-index.yaml`

<a id="github-operational-templates"></a>
## GitHub Operational Templates

- Issue forms: `.github/ISSUE_TEMPLATE/*.yml`
- Pull request templates: `.github/PULL_REQUEST_TEMPLATE/*.md`
- Community files: `CONTRIBUTING.md`, `SECURITY.md`, `SUPPORT.md`, `GOVERNANCE.md`
- CI sample: `ci/github-actions/validate-policy-evidence.yml`

<a id="validation"></a>
## Validation

`./scripts/validate-template-baseline.sh .` checks the required directory layout, required record templates, GitHub templates, and evidence index placeholders.

<a id="source-basis"></a>
## Source Basis

See `references/REFERENCE_INDEX.md` for all external and internal source IDs used to derive these templates.
