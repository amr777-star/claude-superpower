# Claude Superpower

Portable setup for 146 specialist subagents, 8 orchestrator skills, 15 slash commands, and intelligent auto-routing — works across all Claude environments.

## What's Inside

| Component | Count | Description |
|-----------|-------|-------------|
| **Subagents** | 146 | Language, framework, DevOps, security, data, and domain specialists |
| **Orchestrator Skills** | 8 | Workflow chains that sequence multiple agents automatically |
| **Slash Commands** | 15 | Quick generators for reviews, designs, plans, and analysis |
| **GSD Commands** | 31 | Project management workflow (Get Shit Done system) |
| **Master Config** | 1 | CLAUDE.md with auto-routing rules for all components |

## Quick Start

### Claude Code (CLI / VS Code / JetBrains)

```bash
git clone https://github.com/YOUR_USERNAME/claude-superpower.git
cd claude-superpower
bash install.sh
```

Or on PowerShell:
```powershell
git clone https://github.com/YOUR_USERNAME/claude-superpower.git
cd claude-superpower
.\install.ps1
```

That's it. Everything auto-triggers in Claude Code from this point.

### claude.ai (Web)

1. Go to [claude.ai](https://claude.ai)
2. Create a new **Project**
3. Open Project Settings → **Custom Instructions**
4. Paste the contents of `config/claude-web-instructions.md`
5. All conversations in that project now have specialist routing

### Claude Desktop App

See `config/claude-desktop-setup.md` for full instructions.

### Claude API / SDK

```python
with open("config/claude-web-instructions.md") as f:
    system_prompt = f.read()

# Use as system message in API calls
```

## Environment Coverage

| Environment | Method | Auto-Triggers? |
|-------------|--------|---------------|
| Claude Code CLI | `~/.claude/` directory | Yes |
| Claude Code + VS Code | Same `~/.claude/` | Yes |
| Claude Code + JetBrains | Same `~/.claude/` | Yes |
| claude.ai (web) | Project custom instructions | Yes |
| Claude Desktop | System prompt / Claude Code | Yes |
| Claude API/SDK | System message | Yes |

## Orchestrator Skills

These skills chain multiple agents together with live context injection:

| Skill | Command | What It Does |
|-------|---------|-------------|
| **workflow-runner** | `/workflow-runner <chain>` | Runs: `code-gen`, `code-mod`, `review`, `deploy`, `debug` chains |
| **smart-commit** | `/smart-commit` | Pre-commit validation + message generation + git commit |
| **deep-review** | `/deep-review` | Parallel code + security + performance review |
| **debug-flow** | `/debug-flow <error>` | Root cause → fix → validate → test |
| **scaffold** | `/scaffold <type> <desc>` | Architecture + design + code gen for new projects |
| **impact-check** | `/impact-check` | Blast-radius analysis before changes |
| **project-context** | *(auto)* | Background: injects git state, project type |
| **agent-guide** | *(auto)* | Background: routing decision matrix |

## Workflow Chains

```
Code Generation:   language-specialist → output-validator → self-corrector → pre-commit-checker
Code Modification: change-impact-analyzer → language-specialist → output-validator → self-corrector → pre-commit-checker
Code Review:       code-reviewer + security-auditor + performance-engineer (parallel)
Pre-Deployment:    quality-gate + security-auditor + change-impact-analyzer (parallel)
Debug & Fix:       debugger → language-specialist → output-validator → self-corrector → test-automator
```

## Syncing Changes

After making changes to agents/skills/commands locally:

```bash
cd claude-superpower
bash sync.sh        # Pulls changes from ~/.claude/ back to repo
git add -A && git commit -m "Sync latest changes"
git push
```

On another machine:
```bash
git pull
bash install.sh     # Deploys updates to ~/.claude/
```

## Repo Structure

```
claude-superpower/
├── agents/              # 146 specialist subagent prompts (.md)
├── skills/              # 8 orchestrator skill directories
│   ├── workflow-runner/   # Multi-agent workflow chains
│   ├── smart-commit/      # Intelligent git commit
│   ├── deep-review/       # Parallel 3-dimension review
│   ├── debug-flow/        # End-to-end debug workflow
│   ├── project-context/   # Background auto-context
│   ├── agent-guide/       # Background routing reference
│   ├── scaffold/          # Project bootstrapping
│   └── impact-check/      # Blast-radius analysis
├── commands/            # Slash commands
│   ├── general/           # 6 general commands
│   ├── ui/                # 9 UI design commands
│   ├── gsd/               # 31 GSD project management
│   └── subagent-catalog/  # 5 catalog commands
├── config/
│   ├── CLAUDE.md                    # Master routing config
│   ├── claude-web-instructions.md   # For claude.ai Projects
│   └── claude-desktop-setup.md      # Desktop app guide
├── install.sh           # Bash installer
├── install.ps1          # PowerShell installer
├── sync.sh              # Sync live → repo
└── README.md
```

## License

Personal use. Subagent prompts are custom-built specialist configurations.
