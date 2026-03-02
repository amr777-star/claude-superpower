#!/usr/bin/env bash
# ============================================================================
# Claude Superpower Installer
# Deploys agents, skills, commands, and config to ~/.claude/
# Works on: Linux, macOS, Windows (Git Bash/WSL)
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
    [ -f "$CLAUDE_DIR/CLAUDE.md" ] && cp "$CLAUDE_DIR/CLAUDE.md" "$BACKUP_DIR/" 2>/dev/null || true
    log "Backup complete."
fi

# ---- Install Agents ----
log "Installing specialist subagents..."
cp "$SCRIPT_DIR"/agents/*.md "$CLAUDE_DIR/agents/"
AGENT_COUNT=$(ls "$CLAUDE_DIR/agents/"*.md 2>/dev/null | wc -l)
log "  Agents installed: $AGENT_COUNT"

# ---- Install Orchestrator Skills (13 skills) ----
log "Installing 13 orchestrator skills..."
for skill_dir in "$SCRIPT_DIR"/skills/*/; do
    skill_name=$(basename "$skill_dir")
    mkdir -p "$CLAUDE_DIR/skills/$skill_name"
    cp -r "$skill_dir"* "$CLAUDE_DIR/skills/$skill_name/" 2>/dev/null || true
done
SKILL_COUNT=$(ls -d "$CLAUDE_DIR/skills/"*/ 2>/dev/null | wc -l)
log "  Skills installed: $SKILL_COUNT"

# ---- Install Slash Commands ----
log "Installing slash commands..."

# General (10)
cp "$SCRIPT_DIR"/commands/general/*.md "$CLAUDE_DIR/commands/" 2>/dev/null || true
GEN_COUNT=$(ls "$SCRIPT_DIR"/commands/general/*.md 2>/dev/null | wc -l)
log "  General commands: $GEN_COUNT"

# UI (9)
cp "$SCRIPT_DIR"/commands/ui/*.md "$CLAUDE_DIR/commands/ui/" 2>/dev/null || true
UI_COUNT=$(ls "$SCRIPT_DIR"/commands/ui/*.md 2>/dev/null | wc -l)
log "  UI commands: $UI_COUNT"

# GSD (31)
if [ -d "$SCRIPT_DIR/commands/gsd" ]; then
    cp "$SCRIPT_DIR"/commands/gsd/*.md "$CLAUDE_DIR/commands/gsd/" 2>/dev/null || true
    GSD_COUNT=$(ls "$SCRIPT_DIR"/commands/gsd/*.md 2>/dev/null | wc -l)
    log "  GSD commands: $GSD_COUNT"
fi

# Subagent Catalog (5)
if [ -d "$SCRIPT_DIR/commands/subagent-catalog" ]; then
    cp "$SCRIPT_DIR"/commands/subagent-catalog/*.md "$CLAUDE_DIR/commands/subagent-catalog/" 2>/dev/null || true
    CAT_COUNT=$(ls "$SCRIPT_DIR"/commands/subagent-catalog/*.md 2>/dev/null | wc -l)
    log "  Catalog commands: $CAT_COUNT"
fi

# ---- Install CLAUDE.md (master config) ----
log "Installing CLAUDE.md (master routing config)..."
if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
    # Merge: append our config if it doesn't already contain our marker
    if ! grep -q "## Orchestrator Skills" "$CLAUDE_DIR/CLAUDE.md" 2>/dev/null; then
        warn "Existing CLAUDE.md found without orchestrator skills section."
        warn "Replacing with full config (backup saved)."
        cp "$SCRIPT_DIR/config/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
    else
        info "CLAUDE.md already contains orchestrator skills. Updating..."
        cp "$SCRIPT_DIR/config/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
    fi
else
    cp "$SCRIPT_DIR/config/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
fi
log "  CLAUDE.md installed."

# ---- Summary ----
echo ""
echo "================================================"
echo -e "  ${GREEN}Installation Complete!${NC}"
echo "================================================"
echo ""
log "Installed to: $CLAUDE_DIR"
echo ""
echo "  Components:"
echo "    Agents:              $AGENT_COUNT (includes 7 guardrail + 18 UI/UX specialist)"
echo "    Orchestrator Skills: $SKILL_COUNT (8 workflow + 5 power tools)"
echo "    Slash Commands:      32 (10 general + 22 UI)"
echo "    GSD Commands:        31"
echo "    Catalog Commands:    5"
echo "    Master Config:       CLAUDE.md (with code generation guardrails)"
echo ""
echo "  Works automatically in:"
echo "    - Claude Code CLI (terminal)"
echo "    - Claude Code in VS Code"
echo "    - Claude Code in JetBrains"
echo ""
echo "  For claude.ai web, paste contents of:"
echo "    config/claude-web-instructions.md"
echo "    into a Claude Project's custom instructions."
echo ""
echo "  For Claude Desktop, see:"
echo "    config/claude-desktop-setup.md"
echo ""
