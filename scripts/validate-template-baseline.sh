#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="${1:-.}"
FAIL=0
COUNT=0

require_pattern() {
  local file="$1"
  local pattern="$2"
  local label="$3"
  if ! grep -Eq "$pattern" "$file"; then
    printf 'FAIL %s: missing %s\n' "$file" "$label" >&2
    FAIL=1
  fi
}

while IFS= read -r -d '' file; do
  COUNT=$((COUNT + 1))
  case "$file" in
    */INDEX.md) continue ;;
    ./.structs/agentsys/AGENTS.md|*/.structs/agentsys/AGENTS.md) continue ;;
  esac
  require_pattern "$file" '^---$' 'YAML front matter delimiter'
  require_pattern "$file" '^template_id:' 'template_id'
  require_pattern "$file" '^template_family:' 'template_family'
  require_pattern "$file" '^owner_role:' 'owner_role'
  require_pattern "$file" '^source_basis:' 'source_basis'
  require_pattern "$file" '^## Purpose$' 'Purpose section'
  require_pattern "$file" '^## Evidence Required$' 'Evidence Required section'
  require_pattern "$file" '^## Validation$' 'Validation section'
  require_pattern "$file" '^## Rollback or Backout$' 'Rollback or Backout section'
  require_pattern "$file" '^## References$' 'References section'
  require_pattern "$file" '^## Version History$' 'Version History section'
done < <(find "$ROOT_DIR/.structs" -type f -name '*.md' -print0 | sort -z)

printf 'Scanned %s markdown files under %s/.structs\n' "$COUNT" "$ROOT_DIR"
if [[ "$FAIL" -ne 0 ]]; then
  exit 1
fi
printf 'PASS template baseline validation\n'
