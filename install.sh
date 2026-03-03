#!/usr/bin/env bash
# ============================================================================
# Claude Superpower Installer
# Deploys agents, skills, commands, and config to ~/.claude/
# Works on: Linux, macOS, Windows (Git Bash/WSL)
# Handles ALL skills dynamically (no hardcoded list)
# ============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
BACKUP_DIR="$CLAUDE_DIR/backups/pre-superpower-$(date +%Y%m%d-%H%M%S)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log()   { echo -e "${GREEN}[+]${NC} $1"; }
warn()  { echo -e "${YELLOW}[!]${NC} $1"; }
error() { echo -e "${RED}[x]${NC} $1"; }
info()  { echo -e "${BLUE}[i]${NC} $1"; }

# ---- Pre-flight checks ----
if [ ! -d "$SCRIPT_DIR/agents" ] || [ ! -d "$SCRIPT_DIR/skills" ]; then
    error "Run this script from the claude-superpower repo root."
    exit 1
fi

echo ""
echo "================================================"
echo "  Claude Superpower Installer"
echo "================================================"
echo ""
info "Source:      $SCRIPT_DIR"
info "Target:      $CLAUDE_DIR"
echo ""

# ---- Create ~/.claude if needed ----
mkdir -p "$CLAUDE_DIR"/{agents,skills,commands/{ui,gsd,subagent-catalog}}

# ---- Backup existing files ----
NEEDS_BACKUP=false
if [ -d "$CLAUDE_DIR/agents" ] && [ "$(ls -A "$CLAUDE_DIR/agents" 2>/dev/null)" ]; then
    NEEDS_BACKUP=true
fi

if $NEEDS_BACKUP; then
    warn "Existing setup detected. Creating backup at:"
    warn "  $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    [ -d "$CLAUDE_DIR/agents" ] && cp -r "$CLAUDE_DIR/agents" "$BACKUP_DIR/" 2>/dev/null || true
    [ -d "$CLAUDE_DIR/skills" ] && cp -r "$CLAUDE_DIR/skills" "$BACKUP_DIR/" 2>/dev/null || true
    [ -f "$CLAUDE_DIR/CLAUDE.md" ] && cp "$CLAUDE_DIR/CLAUDE.md" "$BACKUP_DIR/" 2>/dev/null || true
    log "Backup complete."
fi

# ---- Install Agents ----
log "Installing specialist subagents..."
cp "$SCRIPT_DIR"/agents/*.md "$CLAUDE_DIR/agents/"
AGENT_COUNT=$(ls "$CLAUDE_DIR/agents/"*.md 2>/dev/null | wc -l)
log "  Agents installed: $AGENT_COUNT"

# ---- Install ALL Skills (dynamic) ----
log "Installing skills..."
for skill_dir in "$SCRIPT_DIR"/skills/*/; do
    if [ -d "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")
        mkdir -p "$CLAUDE_DIR/skills/$skill_name"
        cp -r "$skill_dir"* "$CLAUDE_DIR/skills/$skill_name/" 2>/dev/null || true
    fi
done
SKILL_COUNT=$(ls -d "$CLAUDE_DIR/skills/"*/ 2>/dev/null | wc -l)
log "  Skills installed: $SKILL_COUNT"

# ---- Install Slash Commands ----
log "Installing slash commands..."

# General (root level)
cp "$SCRIPT_DIR"/commands/general/*.md "$CLAUDE_DIR/commands/" 2>/dev/null || true
GEN_COUNT=$(ls "$SCRIPT_DIR"/commands/general/*.md 2>/dev/null | wc -l)
log "  General commands: $GEN_COUNT"

# UI
cp "$SCRIPT_DIR"/commands/ui/*.md "$CLAUDE_DIR/commands/ui/" 2>/dev/null || true
UI_COUNT=$(ls "$SCRIPT_DIR"/commands/ui/*.md 2>/dev/null | wc -l)
log "  UI commands: $UI_COUNT"

# GSD
if [ -d "$SCRIPT_DIR/commands/gsd" ]; then
    cp "$SCRIPT_DIR"/commands/gsd/*.md "$CLAUDE_DIR/commands/gsd/" 2>/dev/null || true
    GSD_COUNT=$(ls "$SCRIPT_DIR"/commands/gsd/*.md 2>/dev/null | wc -l)
    log "  GSD commands: $GSD_COUNT"
else
    GSD_COUNT=0
fi

# Subagent Catalog
if [ -d "$SCRIPT_DIR/commands/subagent-catalog" ]; then
    cp "$SCRIPT_DIR"/commands/subagent-catalog/*.md "$CLAUDE_DIR/commands/subagent-catalog/" 2>/dev/null || true
    cp "$SCRIPT_DIR"/commands/subagent-catalog/config.sh "$CLAUDE_DIR/commands/subagent-catalog/" 2>/dev/null || true
    CAT_COUNT=$(ls "$SCRIPT_DIR"/commands/subagent-catalog/*.md 2>/dev/null | wc -l)
    log "  Catalog commands: $CAT_COUNT"
else
    CAT_COUNT=0
fi

# ---- Install CLAUDE.md (master config) ----
log "Installing CLAUDE.md (master routing config)..."
cp "$SCRIPT_DIR/config/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
log "  CLAUDE.md installed."

# ---- Summary ----
CMD_TOTAL=$((GEN_COUNT + UI_COUNT + GSD_COUNT + CAT_COUNT))
GRAND_TOTAL=$((AGENT_COUNT + SKILL_COUNT + CMD_TOTAL + 1))

echo ""
echo "================================================"
echo -e "  ${GREEN}Installation Complete!${NC}"
echo "================================================"
echo ""
log "Installed to: $CLAUDE_DIR"
echo ""
echo "  Components ($GRAND_TOTAL total):"
echo "    Agents:           $AGENT_COUNT"
echo "    Skills:           $SKILL_COUNT"
echo "    Slash Commands:   $CMD_TOTAL"
echo "      General:        $GEN_COUNT"
echo "      UI:             $UI_COUNT"
echo "      GSD:            $GSD_COUNT"
echo "      Catalog:        $CAT_COUNT"
echo "    Master Config:    CLAUDE.md"
echo ""
echo "  Auto-works in:"
echo "    - Claude Code CLI (terminal)"
echo "    - Claude Code in VS Code"
echo "    - Claude Code in JetBrains"
echo ""
echo "  For other environments:"
echo "    claude.ai web:    Paste config/claude-web-instructions.md"
echo "                      into Project -> Custom Instructions"
echo ""
echo "    Claude Desktop:   See config/claude-desktop-setup.md"
echo ""
echo "    API/SDK:          Use config/claude-api-system-prompt.md"
echo "                      as your system message"
echo ""
