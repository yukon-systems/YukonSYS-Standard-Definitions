#!/usr/bin/env python3
"""Validate the policy evidence index YAML or JSON at a minimum structural level."""
from __future__ import annotations

import json
import sys
from pathlib import Path

REQUIRED_TOP_LEVEL = {"repository", "records", "gates"}


def load_document(path: Path):
    text = path.read_text(encoding="utf-8")
    if path.suffix.lower() == ".json":
        return json.loads(text)
    try:
        import yaml  # type: ignore
    except Exception as exc:  # pragma: no cover
        raise SystemExit(f"PyYAML is required for YAML validation: {exc}")
    return yaml.safe_load(text)


def main(argv: list[str]) -> int:
    if len(argv) != 2:
        print("usage: validate-evidence-index.py <docs/evidence-index.yaml|json>", file=sys.stderr)
        return 2
    path = Path(argv[1])
    if not path.is_file():
        print(f"missing evidence index: {path}", file=sys.stderr)
        return 1
    data = load_document(path)
    if not isinstance(data, dict):
        print("evidence index must be a mapping", file=sys.stderr)
        return 1
    missing = sorted(REQUIRED_TOP_LEVEL - set(data))
    if missing:
        print(f"missing top-level keys: {', '.join(missing)}", file=sys.stderr)
        return 1
    exceptions = data.get("exceptions", []) or []
    for item in exceptions:
        if not isinstance(item, dict):
            print("exception entries must be mappings", file=sys.stderr)
            return 1
        expiry = str(item.get("expiry_date", "")).strip().lower()
        if expiry in {"", "none", "open", "open-ended", "indefinite"}:
            print("open-ended exception detected", file=sys.stderr)
            return 1
    print("PASS evidence index validation")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
