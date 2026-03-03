#!/usr/bin/env bash
# ============================================================================
# Claude Superpower Sync
# Syncs changes FROM ~/.claude/ BACK to the repo (for committing updates)
# Handles ALL skills dynamically (no hardcoded list)
# ============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

log()  { echo -e "${GREEN}[+]${NC} $1"; }
info() { echo -e "${BLUE}[i]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }

echo ""
echo "================================================"
echo "  Claude Superpower Sync (live -> repo)"
echo "================================================"
echo ""

# ---- Sync agents ----
log "Syncing agents..."
mkdir -p "$SCRIPT_DIR/agents"
cp "$CLAUDE_DIR"/agents/*.md "$SCRIPT_DIR/agents/" 2>/dev/null || true
AGENT_COUNT=$(ls "$SCRIPT_DIR/agents/"*.md 2>/dev/null | wc -l)
echo "  $AGENT_COUNT agents synced"

# ---- Sync ALL skills (dynamic — no hardcoded list) ----
log "Syncing skills..."
mkdir -p "$SCRIPT_DIR/skills"
for skill_dir in "$CLAUDE_DIR"/skills/*/; do
    if [ -d "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")
        mkdir -p "$SCRIPT_DIR/skills/$skill_name"
        cp -r "$skill_dir"* "$SCRIPT_DIR/skills/$skill_name/" 2>/dev/null || true
    fi
done
SKILL_COUNT=$(ls -d "$SCRIPT_DIR/skills/"*/ 2>/dev/null | wc -l)
echo "  $SKILL_COUNT skills synced"

# ---- Sync commands ----
log "Syncing commands..."

# General commands (root level .md files)
mkdir -p "$SCRIPT_DIR/commands/general"
cp "$CLAUDE_DIR"/commands/*.md "$SCRIPT_DIR/commands/general/" 2>/dev/null || true
GEN_COUNT=$(ls "$SCRIPT_DIR/commands/general/"*.md 2>/dev/null | wc -l)
echo "  General commands: $GEN_COUNT"

# UI commands
mkdir -p "$SCRIPT_DIR/commands/ui"
cp "$CLAUDE_DIR"/commands/ui/*.md "$SCRIPT_DIR/commands/ui/" 2>/dev/null || true
UI_COUNT=$(ls "$SCRIPT_DIR/commands/ui/"*.md 2>/dev/null | wc -l)
echo "  UI commands: $UI_COUNT"

# GSD commands
mkdir -p "$SCRIPT_DIR/commands/gsd"
cp "$CLAUDE_DIR"/commands/gsd/*.md "$SCRIPT_DIR/commands/gsd/" 2>/dev/null || true
GSD_COUNT=$(ls "$SCRIPT_DIR/commands/gsd/"*.md 2>/dev/null | wc -l)
echo "  GSD commands: $GSD_COUNT"

# Subagent catalog commands
mkdir -p "$SCRIPT_DIR/commands/subagent-catalog"
cp "$CLAUDE_DIR"/commands/subagent-catalog/*.md "$SCRIPT_DIR/commands/subagent-catalog/" 2>/dev/null || true
cp "$CLAUDE_DIR"/commands/subagent-catalog/config.sh "$SCRIPT_DIR/commands/subagent-catalog/" 2>/dev/null || true
CAT_COUNT=$(ls "$SCRIPT_DIR/commands/subagent-catalog/"*.md 2>/dev/null | wc -l)
echo "  Catalog commands: $CAT_COUNT"

# ---- Sync CLAUDE.md ----
log "Syncing CLAUDE.md..."
cp "$CLAUDE_DIR/CLAUDE.md" "$SCRIPT_DIR/config/CLAUDE.md" 2>/dev/null || true

# ---- Summary ----
TOTAL=$((AGENT_COUNT + SKILL_COUNT + GEN_COUNT + UI_COUNT + GSD_COUNT + CAT_COUNT))
echo ""
echo "================================================"
echo -e "  ${GREEN}Sync Complete!${NC}"
echo "================================================"
echo ""
echo "  Components synced: $TOTAL"
echo "    Agents:       $AGENT_COUNT"
echo "    Skills:       $SKILL_COUNT"
echo "    General:      $GEN_COUNT"
echo "    UI:           $UI_COUNT"
echo "    GSD:          $GSD_COUNT"
echo "    Catalog:      $CAT_COUNT"
echo "    CLAUDE.md:    1"
echo ""
info "Review changes with: cd $SCRIPT_DIR && git diff"
echo ""
