#!/usr/bin/env bash
# ============================================================================
# Claude Superpower Sync
# Syncs changes FROM ~/.claude/ BACK to the repo (for committing updates)
# ============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

log()  { echo -e "${GREEN}[+]${NC} $1"; }
info() { echo -e "${BLUE}[i]${NC} $1"; }

echo ""
echo "================================================"
echo "  Claude Superpower Sync (live → repo)"
echo "================================================"
echo ""

# Sync agents
log "Syncing agents..."
cp "$CLAUDE_DIR"/agents/*.md "$SCRIPT_DIR/agents/" 2>/dev/null || true
echo "  $(ls "$SCRIPT_DIR/agents/"*.md | wc -l) agents synced"

# Sync orchestrator skills
log "Syncing orchestrator skills..."
for skill in workflow-runner smart-commit deep-review debug-flow project-context agent-guide scaffold impact-check; do
    if [ -d "$CLAUDE_DIR/skills/$skill" ]; then
        mkdir -p "$SCRIPT_DIR/skills/$skill"
        cp -r "$CLAUDE_DIR/skills/$skill/"* "$SCRIPT_DIR/skills/$skill/" 2>/dev/null || true
    fi
done
echo "  $(ls -d "$SCRIPT_DIR/skills/"*/ | wc -l) skills synced"

# Sync commands
log "Syncing commands..."
cp "$CLAUDE_DIR"/commands/code-review.md "$CLAUDE_DIR"/commands/creative-writer.md "$CLAUDE_DIR"/commands/data-analyst.md "$CLAUDE_DIR"/commands/project-manager.md "$CLAUDE_DIR"/commands/research-assistant.md "$CLAUDE_DIR"/commands/system-architect.md "$SCRIPT_DIR/commands/general/" 2>/dev/null || true
cp "$CLAUDE_DIR"/commands/ui/*.md "$SCRIPT_DIR/commands/ui/" 2>/dev/null || true
cp "$CLAUDE_DIR"/commands/gsd/*.md "$SCRIPT_DIR/commands/gsd/" 2>/dev/null || true
cp "$CLAUDE_DIR"/commands/subagent-catalog/*.md "$SCRIPT_DIR/commands/subagent-catalog/" 2>/dev/null || true
echo "  Commands synced"

# Sync CLAUDE.md
log "Syncing CLAUDE.md..."
cp "$CLAUDE_DIR/CLAUDE.md" "$SCRIPT_DIR/config/CLAUDE.md" 2>/dev/null || true

echo ""
log "Sync complete. Review changes with: cd $SCRIPT_DIR && git diff"
echo ""
