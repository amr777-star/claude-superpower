# ============================================================================
# Claude Superpower Installer (PowerShell)
# Deploys agents, skills, commands, and config to ~/.claude/
# Works on: Windows PowerShell 5.1+, PowerShell 7+
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
    if (Test-Path "$ClaudeDir\CLAUDE.md") { Copy-Item "$ClaudeDir\CLAUDE.md" "$BackupDir\CLAUDE.md" -ErrorAction SilentlyContinue }
    Log "Backup saved to: $BackupDir"
}

# ---- Install Agents ----
Log "Installing specialist subagents..."
Copy-Item "$ScriptDir\agents\*.md" "$ClaudeDir\agents\" -Force
$agentCount = (Get-ChildItem "$ClaudeDir\agents\*.md").Count
Log "  Agents installed: $agentCount"

# ---- Install Skills ----
Log "Installing orchestrator skills..."
Get-ChildItem "$ScriptDir\skills" -Directory | ForEach-Object {
    $dest = Join-Path "$ClaudeDir\skills" $_.Name
    if (-not (Test-Path $dest)) { New-Item -ItemType Directory -Path $dest -Force | Out-Null }
    Copy-Item "$($_.FullName)\*" $dest -Recurse -Force
}
$skillCount = (Get-ChildItem "$ClaudeDir\skills" -Directory).Count
Log "  Skills installed: $skillCount"

# ---- Install Commands ----
Log "Installing slash commands..."
Copy-Item "$ScriptDir\commands\general\*.md" "$ClaudeDir\commands\" -Force -ErrorAction SilentlyContinue
Copy-Item "$ScriptDir\commands\ui\*.md" "$ClaudeDir\commands\ui\" -Force -ErrorAction SilentlyContinue
Copy-Item "$ScriptDir\commands\gsd\*.md" "$ClaudeDir\commands\gsd\" -Force -ErrorAction SilentlyContinue
Copy-Item "$ScriptDir\commands\subagent-catalog\*.md" "$ClaudeDir\commands\subagent-catalog\" -Force -ErrorAction SilentlyContinue
Log "  Commands installed: general(10), UI(22), GSD(31), catalog(5)"

# ---- Install CLAUDE.md ----
Log "Installing CLAUDE.md..."
Copy-Item "$ScriptDir\config\CLAUDE.md" "$ClaudeDir\CLAUDE.md" -Force
Log "  CLAUDE.md installed."

# ---- Summary ----
Write-Host ""
Write-Host "================================================"
Write-Host "  Installation Complete!" -ForegroundColor Green
Write-Host "================================================"
Write-Host ""
Log "Installed to: $ClaudeDir"
Write-Host ""
Write-Host "  Components:"
Write-Host "    Agents:              $agentCount (includes 7 guardrail + 18 UI/UX specialist)"
Write-Host "    Orchestrator Skills: $skillCount (8 workflow + 5 power tools)"
Write-Host "    Slash Commands:      32 (10 general + 22 UI)"
Write-Host "    GSD Commands:        31"
Write-Host "    Catalog Commands:    5"
Write-Host "    Master Config:       CLAUDE.md (with code generation guardrails)"
Write-Host ""
Write-Host "  Works automatically in:"
Write-Host "    - Claude Code CLI (terminal)"
Write-Host "    - Claude Code in VS Code"
Write-Host "    - Claude Code in JetBrains"
Write-Host ""
Write-Host "  For claude.ai web:"
Write-Host "    Paste config\claude-web-instructions.md into a Claude Project"
Write-Host ""
