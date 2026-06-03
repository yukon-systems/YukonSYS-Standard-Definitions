# Expansion Manifest

<a id="toc"></a>
## Table of Contents

- [Generated On](#generated-on)
- [Major Additions](#major-additions)
- [Validation Command](#validation-command)
- [Notes](#notes)

<a id="generated-on"></a>
## Generated On

2026-06-03

<a id="major-additions"></a>
## Major Additions

- Added `.structs/agentsys/AGENTS.md` from root `AGENTS.md`.
- Added `.structs/agentsys/AGENT_RULES.md` routing rules.
- Added `.structs/agentsys/AGENT_AUGMENTS.md` per-agent controls.
- Added language/domain standards under `.structs/langsys/`.
- Added OS operator-language standards under `.structs/opersys/`.
- Added hardware, networking, and infrastructure standards under `.structs/hwsys/`.
- Added compliance/source/security/validation definitions under `.structs/specsys/`.
- Added `scripts/validate-template-baseline.sh`.

<a id="validation-command"></a>
## Validation Command

```sh
scripts/validate-template-baseline.sh
```

<a id="notes"></a>
## Notes

- Files are draft standards requiring environment-specific review before production adoption.
- Several vendor tools require local installation or vendor portal access; commands are therefore controlled command surfaces, not proof of availability.
- `BigNetwork` is included under VPN protocols as a placeholder pending exact product/protocol identification and official source attestation.
