#!/usr/bin/env bash
# Install awesome-grok-build skills into your project.
# Usage: curl -fsSL https://raw.githubusercontent.com/DominikTobureto/awesome-grok-build/main/install.sh | bash
# Or:    bash install.sh [target-directory]

set -euo pipefail

TARGET="${1:-.}"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m'

say()  { printf "${BOLD}%b${NC}\n" "$*"; }
ok()   { printf "${GREEN}  ✓${NC} %s\n" "$*"; }
warn() { printf "${YELLOW}  ⚠${NC} %s\n" "$*"; }
err()  { printf "${RED}  ✗${NC} %s\n" "$*"; }

REPO_URL="https://github.com/DominikTobureto/awesome-grok-build.git"
TMP_DIR="$(mktemp -d)"

cleanup() { rm -rf "$TMP_DIR"; }
trap cleanup EXIT

say "\n🚀 awesome-grok-build installer\n"

# --- Clone ---
say "Cloning awesome-grok-build..."
if git clone --depth 1 "$REPO_URL" "$TMP_DIR" 2>/dev/null; then
  ok "Cloned successfully"
else
  err "Failed to clone. Check your git installation and network."
  exit 1
fi

# --- Skills ---
say "\nInstalling skills..."
mkdir -p "$TARGET/.grok/skills"
SKILL_COUNT=0
for skill_dir in "$TMP_DIR/.grok/skills/"*; do
  skill_name="$(basename "$skill_dir")"
  if [ -f "$skill_dir/SKILL.md" ]; then
    cp -R "$skill_dir" "$TARGET/.grok/skills/"
    ok "$skill_name"
    SKILL_COUNT=$((SKILL_COUNT + 1))
  fi
done

if [ "$SKILL_COUNT" -eq 0 ]; then
  warn "No skills found to install."
else
  say "  → ${SKILL_COUNT} skills installed to $TARGET/.grok/skills/"
fi

# --- AGENTS.md ---
say "\nAGENTS.md"
if [ -f "$TARGET/AGENTS.md" ]; then
  warn "AGENTS.md already exists — skipping."
else
  echo ""
  echo "  Pick an AGENTS.md template:"
  echo "    1) Full-stack (SaaS, dashboards)"
  echo "    2) Library / SDK"
  echo "    3) Documentation / awesome list"
  echo "    4) Security-sensitive"
  echo "    5) Skip"
  echo ""
  read -r -p "  Choice [1-5]: " choice
  case "$choice" in
    1) cp "$TMP_DIR/templates/AGENTS.fullstack.md" "$TARGET/AGENTS.md" && ok "Installed AGENTS.fullstack.md" ;;
    2) cp "$TMP_DIR/templates/AGENTS.library.md"   "$TARGET/AGENTS.md" && ok "Installed AGENTS.library.md" ;;
    3) cp "$TMP_DIR/templates/AGENTS.docs.md"      "$TARGET/AGENTS.md" && ok "Installed AGENTS.docs.md" ;;
    4) cp "$TMP_DIR/templates/AGENTS.security.md"  "$TARGET/AGENTS.md" && ok "Installed AGENTS.security.md" ;;
    5|"") warn "Skipped AGENTS.md" ;;
    *) warn "Invalid choice — skipped AGENTS.md" ;;
  esac
fi

# --- .grokignore ---
say "\n.grokignore"
if [ -f "$TARGET/.grokignore" ]; then
  warn ".grokignore already exists — skipping."
else
  echo ""
  echo "  Pick a .grokignore variant:"
  echo "    1) Default (universal)"
  echo "    2) Node.js / TypeScript"
  echo "    3) Python"
  echo "    4) Skip"
  echo ""
  read -r -p "  Choice [1-4]: " choice
  case "$choice" in
    1) cp "$TMP_DIR/templates/grokignore.default" "$TARGET/.grokignore" && ok "Installed grokignore.default" ;;
    2) cp "$TMP_DIR/templates/grokignore.node"    "$TARGET/.grokignore" && ok "Installed grokignore.node" ;;
    3) cp "$TMP_DIR/templates/grokignore.python"  "$TARGET/.grokignore" && ok "Installed grokignore.python" ;;
    4|"") warn "Skipped .grokignore" ;;
    *) warn "Invalid choice — skipped .grokignore" ;;
  esac
fi

# --- Done ---
say "\n✅ Done!"
echo ""
echo "  Next steps:"
echo "    cd $TARGET"
echo "    grok inspect"
echo "    grok"
echo ""
echo "  Try your first prompt:"
echo "    Use repo-health-check. Find the smallest safe PR."
echo ""
