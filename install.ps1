# ============================================================================
# Claude Superpower Installer (PowerShell)
# Deploys agents, skills, commands, and config to ~/.claude/
# Works on: Windows PowerShell 5.1+, PowerShell 7+
# Handles ALL skills dynamically (no hardcoded list)
# ============================================================================

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ClaudeDir = Join-Path $env:USERPROFILE ".claude"
$BackupDir = Join-Path $ClaudeDir "backups\pre-superpower-$(Get-Date -Format 'yyyyMMdd-HHmmss')"

function Log($msg)   { Write-Host "[+] $msg" -ForegroundColor Green }
function Warn($msg)  { Write-Host "[!] $msg" -ForegroundColor Yellow }
function Error($msg) { Write-Host "[x] $msg" -ForegroundColor Red }
function Info($msg)  { Write-Host "[i] $msg" -ForegroundColor Cyan }

# ---- Pre-flight checks ----
if (-not (Test-Path "$ScriptDir\agents") -or -not (Test-Path "$ScriptDir\skills")) {
    Error "Run this script from the claude-superpower repo root."
    exit 1
}

Write-Host ""
Write-Host "================================================"
Write-Host "  Claude Superpower Installer"
Write-Host "================================================"
Write-Host ""
Info "Source:      $ScriptDir"
Info "Target:      $ClaudeDir"
Write-Host ""

# ---- Create directories ----
$dirs = @(
    "$ClaudeDir\agents",
    "$ClaudeDir\skills",
    "$ClaudeDir\commands",
    "$ClaudeDir\commands\ui",
    "$ClaudeDir\commands\gsd",
    "$ClaudeDir\commands\subagent-catalog"
)
foreach ($dir in $dirs) {
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
}

# ---- Backup existing files ----
if ((Test-Path "$ClaudeDir\agents") -and (Get-ChildItem "$ClaudeDir\agents" -Filter "*.md" -ErrorAction SilentlyContinue)) {
    Warn "Existing setup detected. Creating backup..."
    New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null
    if (Test-Path "$ClaudeDir\agents") { Copy-Item "$ClaudeDir\agents" "$BackupDir\agents" -Recurse -ErrorAction SilentlyContinue }
    if (Test-Path "$ClaudeDir\skills") { Copy-Item "$ClaudeDir\skills" "$BackupDir\skills" -Recurse -ErrorAction SilentlyContinue }
    if (Test-Path "$ClaudeDir\CLAUDE.md") { Copy-Item "$ClaudeDir\CLAUDE.md" "$BackupDir\CLAUDE.md" -ErrorAction SilentlyContinue }
    Log "Backup saved to: $BackupDir"
}

# ---- Install Agents ----
Log "Installing specialist subagents..."
Copy-Item "$ScriptDir\agents\*.md" "$ClaudeDir\agents\" -Force
$agentCount = (Get-ChildItem "$ClaudeDir\agents\*.md").Count
Log "  Agents installed: $agentCount"

# ---- Install ALL Skills (dynamic) ----
Log "Installing skills..."
Get-ChildItem "$ScriptDir\skills" -Directory | ForEach-Object {
    $dest = Join-Path "$ClaudeDir\skills" $_.Name
    if (-not (Test-Path $dest)) { New-Item -ItemType Directory -Path $dest -Force | Out-Null }
    Copy-Item "$($_.FullName)\*" $dest -Recurse -Force
}
$skillCount = (Get-ChildItem "$ClaudeDir\skills" -Directory).Count
Log "  Skills installed: $skillCount"

# ---- Install Commands ----
Log "Installing slash commands..."

# General
Copy-Item "$ScriptDir\commands\general\*.md" "$ClaudeDir\commands\" -Force -ErrorAction SilentlyContinue
$genCount = (Get-ChildItem "$ScriptDir\commands\general\*.md" -ErrorAction SilentlyContinue).Count
Log "  General commands: $genCount"

# UI
Copy-Item "$ScriptDir\commands\ui\*.md" "$ClaudeDir\commands\ui\" -Force -ErrorAction SilentlyContinue
$uiCount = (Get-ChildItem "$ScriptDir\commands\ui\*.md" -ErrorAction SilentlyContinue).Count
Log "  UI commands: $uiCount"

# GSD
if (Test-Path "$ScriptDir\commands\gsd") {
    Copy-Item "$ScriptDir\commands\gsd\*.md" "$ClaudeDir\commands\gsd\" -Force -ErrorAction SilentlyContinue
    $gsdCount = (Get-ChildItem "$ScriptDir\commands\gsd\*.md" -ErrorAction SilentlyContinue).Count
    Log "  GSD commands: $gsdCount"
} else { $gsdCount = 0 }

# Subagent Catalog
if (Test-Path "$ScriptDir\commands\subagent-catalog") {
    Copy-Item "$ScriptDir\commands\subagent-catalog\*.md" "$ClaudeDir\commands\subagent-catalog\" -Force -ErrorAction SilentlyContinue
    Copy-Item "$ScriptDir\commands\subagent-catalog\config.sh" "$ClaudeDir\commands\subagent-catalog\" -Force -ErrorAction SilentlyContinue
    $catCount = (Get-ChildItem "$ScriptDir\commands\subagent-catalog\*.md" -ErrorAction SilentlyContinue).Count
    Log "  Catalog commands: $catCount"
} else { $catCount = 0 }

# ---- Install CLAUDE.md ----
Log "Installing CLAUDE.md..."
Copy-Item "$ScriptDir\config\CLAUDE.md" "$ClaudeDir\CLAUDE.md" -Force
Log "  CLAUDE.md installed."

# ---- Summary ----
$cmdTotal = $genCount + $uiCount + $gsdCount + $catCount
$grandTotal = $agentCount + $skillCount + $cmdTotal + 1

Write-Host ""
Write-Host "================================================"
Write-Host "  Installation Complete!" -ForegroundColor Green
Write-Host "================================================"
Write-Host ""
Log "Installed to: $ClaudeDir"
Write-Host ""
Write-Host "  Components ($grandTotal total):"
Write-Host "    Agents:           $agentCount"
Write-Host "    Skills:           $skillCount"
Write-Host "    Slash Commands:   $cmdTotal"
Write-Host "      General:        $genCount"
Write-Host "      UI:             $uiCount"
Write-Host "      GSD:            $gsdCount"
Write-Host "      Catalog:        $catCount"
Write-Host "    Master Config:    CLAUDE.md"
Write-Host ""
Write-Host "  Auto-works in:"
Write-Host "    - Claude Code CLI (terminal)"
Write-Host "    - Claude Code in VS Code"
Write-Host "    - Claude Code in JetBrains"
Write-Host ""
Write-Host "  For other environments:"
Write-Host "    claude.ai web:    Paste config\claude-web-instructions.md"
Write-Host "                      into Project -> Custom Instructions"
Write-Host ""
Write-Host "    Claude Desktop:   See config\claude-desktop-setup.md"
Write-Host ""
Write-Host "    API/SDK:          Use config\claude-api-system-prompt.md"
Write-Host "                      as your system message"
Write-Host ""
