#!/usr/bin/env sh
#
# Configure Agent Profile Script
# Selects and deploys the appropriate AGENTS.md profile based on the inference provider.
#

set -eu

show_usage() {
  echo "Usage: $0 <provider>"
  echo ""
  echo "Valid providers (ENUM):"
  echo "  codex          - OpenAI Codex legacy instructions"
  echo "  openai-compat  - Generic OpenAI API-compatible instructions"
  echo "  antigravity    - Antigravity-specific tool-aware rules"
  echo "  gemini         - Gemini-specific capabilities (alias for antigravity)"
  echo "  ollama         - Local, offline-oriented agent rules"
  echo "  other          - Generic fallback agent rules"
  echo ""
}

if [ "$#" -ne 1 ]; then
  show_usage >&2
  exit 1
fi

PROVIDER="$1"

# Root path resolution
SCRIPT_DIR="$(dirname "$0")"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROFILES_DIR="$ROOT_DIR/.structs/agentsys/profiles"

case "$PROVIDER" in
  codex|openai-compat|antigravity|gemini|ollama|other)
    PROFILE_FILE="$PROFILES_DIR/AGENTS.$PROVIDER.md"
    ;;
  *)
    echo "[ERROR] Unknown provider: $PROVIDER" >&2
    show_usage >&2
    exit 1
    ;;
esac

if [ ! -f "$PROFILE_FILE" ]; then
  echo "[ERROR] Profile file not found: $PROFILE_FILE" >&2
  exit 1
fi

echo "Activating '$PROVIDER' agent instructions profile..."

# Copy to root and structs location
cp "$PROFILE_FILE" "$ROOT_DIR/AGENTS.md"
cp "$PROFILE_FILE" "$ROOT_DIR/.structs/agentsys/AGENTS.md"

echo "✓ Profile '$PROVIDER' successfully deployed."
echo "  - Root AGENTS.md updated."
echo "  - .structs/agentsys/AGENTS.md updated."
