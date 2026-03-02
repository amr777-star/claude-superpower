# Claude Superpower

> Turn Claude into a self-routing AI coding army — 146 specialist agents, 8 orchestrator skills, 51 slash commands — auto-triggering across **every** Claude environment.

## What's Inside

| Component | Count | Description |
|-----------|-------|-------------|
| **Subagents** | 146 | Language, framework, DevOps, security, data, and domain specialists |
| **Orchestrator Skills** | 8 | Workflow chains that sequence multiple agents automatically |
| **Slash Commands** | 15 | Quick generators for reviews, designs, plans, and analysis |
| **GSD Commands** | 31 | Project management workflow (Get Shit Done system) |
| **Catalog Commands** | 5 | Agent discovery and browsing |
| **Master Config** | 1 | CLAUDE.md with auto-routing rules for all components |
| **Web Instructions** | 1 | Portable project instructions for claude.ai |

## Setup Guide

### Prerequisites

- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed
- Git installed
- (Optional) VS Code or JetBrains IDE with Claude Code extension
- (Optional) [GitHub CLI](https://cli.github.com/) (`gh`) for PR/issue workflows

---

### 1. Claude Code (CLI / VS Code / JetBrains) — Full Power

This is the primary environment. All 146 agents, 8 skills, and 51 commands work here with full auto-triggering.

**On Bash (Linux / macOS / Git Bash on Windows):**
```bash
git clone https://github.com/amr777-star/claude-superpower.git
cd claude-superpower
bash install.sh
```

**On PowerShell (Windows):**
```powershell
git clone https://github.com/amr777-star/claude-superpower.git
cd claude-superpower
.\install.ps1
```

**What happens:**
- Creates `~/.claude/agents/` with 146 specialist subagents
- Creates `~/.claude/skills/` with 8 orchestrator skills
- Creates `~/.claude/commands/` with 51 slash commands
- Installs `~/.claude/CLAUDE.md` master routing config
- Backs up any existing setup before overwriting

**Verify it works:**
```bash
claude  # Open Claude Code
# Type /workflow-runner — should autocomplete
# Type /deep-review — should autocomplete
# Ask "review this code" — auto-routes to 3 parallel reviewers
```

> **VS Code & JetBrains**: No extra setup needed. They read from the same `~/.claude/` directory. Just open the Claude Code sidebar and everything is there.

---

### 2. claude.ai (Web) — Specialist Routing

Claude.ai doesn't support skills/agents directly, but you can replicate the specialist routing intelligence via **Project Custom Instructions**.

1. Go to [claude.ai](https://claude.ai) and sign in
2. Click **Projects** in the sidebar
3. Create a new project (e.g., "Superpower Coding")
4. Click the project name → **Project Settings** → **Custom Instructions**
5. Open `config/claude-web-instructions.md` from this repo
6. Copy the **entire contents** and paste into Custom Instructions
7. Click **Save**

**What you get:**
- Auto-detection of language/framework from context
- 5 workflow chains (code-gen, code-mod, review, debug, deploy)
- 3-dimension code review (quality + security + performance)
- Impact analysis format
- Commit message generation
- Project scaffolding knowledge

> Every new conversation in that project automatically gets specialist routing.

---

### 3. Claude Desktop App

See [`config/claude-desktop-setup.md`](config/claude-desktop-setup.md) for detailed instructions.

**Quick version:** Claude Desktop can launch Claude Code, which already has everything installed. Alternatively, paste the web instructions into the Desktop app's system prompt settings.

---

### 4. Claude API / SDK

Use the web instructions as your system prompt:

```python
import anthropic

client = anthropic.Anthropic()

with open("config/claude-web-instructions.md") as f:
    system_prompt = f.read()

response = client.messages.create(
    model="claude-sonnet-4-6-20250514",
    max_tokens=4096,
    system=system_prompt,
    messages=[{"role": "user", "content": "Review this Python code for security issues..."}]
)
```

```typescript
import Anthropic from "@anthropic-ai/sdk";
import { readFileSync } from "fs";

const client = new Anthropic();
const systemPrompt = readFileSync("config/claude-web-instructions.md", "utf-8");

const response = await client.messages.create({
  model: "claude-sonnet-4-6-20250514",
  max_tokens: 4096,
  system: systemPrompt,
  messages: [{ role: "user", content: "Review this Python code for security issues..." }],
});
```

---

## Environment Coverage

| Environment | Setup Method | Auto-Triggers? |
|-------------|-------------|---------------|
| **Claude Code CLI** | `bash install.sh` → `~/.claude/` | Yes — CLAUDE.md routes all tasks |
| **VS Code + Claude Code** | Same `~/.claude/` (no extra setup) | Yes |
| **JetBrains + Claude Code** | Same `~/.claude/` (no extra setup) | Yes |
| **claude.ai (web)** | Paste `claude-web-instructions.md` into Project | Yes |
| **Claude Desktop** | System prompt or Claude Code integration | Yes |
| **Claude API/SDK** | Use web instructions as system message | Yes |

---

## What Auto-Triggers and When

### In Claude Code (CLI / VS Code / JetBrains)

| You Say | What Happens |
|---------|-------------|
| "Write a React component" | Routes to `react-specialist` + `typescript-pro` agents |
| "Fix this bug: TypeError..." | Runs `/debug-flow` → debugger → language-specialist → validator |
| "Review my changes" | Runs `/deep-review` → 3 parallel reviewers (quality + security + perf) |
| "Commit these changes" | Runs `/smart-commit` → pre-commit check → message gen → git commit |
| "Scaffold a Next.js app" | Runs `/scaffold next-app` → architecture → design → code gen |
| "What's the impact of this change?" | Runs `/impact-check` → blast-radius analysis in forked context |
| "Deploy readiness check" | Runs `/workflow-runner deploy` → quality-gate + security + impact |
| Any Python code task | Auto-routes to `python-pro` agent |
| Any Docker question | Auto-routes to `docker-expert` agent |
| Any security concern | Auto-routes to `security-auditor` or `security-engineer` agent |

### Background (always active, invisible)

| Skill | What It Does |
|-------|-------------|
| `project-context` | Injects git branch, recent commits, project type, directory structure |
| `agent-guide` | Provides routing decision matrix so the right agent is always chosen |

---

## Orchestrator Skills

| Skill | Command | What It Does |
|-------|---------|-------------|
| **workflow-runner** | `/workflow-runner <chain>` | Runs: `code-gen`, `code-mod`, `review`, `deploy`, `debug` |
| **smart-commit** | `/smart-commit` | Pre-commit validation + message generation + git commit |
| **deep-review** | `/deep-review [files]` | Parallel code + security + performance review |
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

## 146 Specialist Agents

<details>
<summary>Click to see all agents by category</summary>

### Language Specialists (14)
`typescript-pro` `javascript-pro` `python-pro` `rust-engineer` `golang-pro` `cpp-pro` `csharp-developer` `java-architect` `php-pro` `swift-expert` `kotlin-specialist` `sql-pro` `elixir-expert` `dotnet-core-expert`

### Framework Specialists (10)
`react-specialist` `nextjs-developer` `vue-expert` `angular-architect` `django-developer` `laravel-specialist` `rails-expert` `spring-boot-engineer` `flutter-expert` `electron-pro`

### DevOps & Infrastructure (15)
`docker-expert` `kubernetes-specialist` `terraform-engineer` `terragrunt-expert` `devops-engineer` `deployment-engineer` `cloud-architect` `azure-infra-engineer` `sre-engineer` `network-engineer` `platform-engineer` `windows-infra-admin` `m365-admin` `it-ops-orchestrator` `devops-incident-responder`

### Quality & Security (15)
`code-reviewer` `security-auditor` `security-engineer` `penetration-tester` `compliance-auditor` `performance-engineer` `qa-expert` `test-automator` `accessibility-tester` `architect-reviewer` `chaos-engineer` `output-validator` `self-corrector` `quality-gate` `pre-commit-checker`

### Data & AI (12)
`sql-pro` `postgres-pro` `database-optimizer` `database-administrator` `data-engineer` `data-scientist` `ml-engineer` `machine-learning-engineer` `mlops-engineer` `llm-architect` `ai-engineer` `nlp-engineer`

### Architecture & API (6)
`api-designer` `api-documenter` `graphql-architect` `microservices-architect` `mcp-developer` `websocket-engineer`

### Frontend & UX (3)
`frontend-developer` `ui-designer` `ux-researcher`

### Developer Tooling (12)
`build-engineer` `cli-developer` `dependency-manager` `documentation-engineer` `dx-optimizer` `git-workflow-manager` `legacy-modernizer` `refactoring-specialist` `powershell-module-architect` `powershell-ui-architect` `powershell-7-expert` `powershell-5.1-expert`

### Business & Product (12)
`business-analyst` `product-manager` `scrum-master` `sales-engineer` `market-researcher` `competitive-analyst` `content-marketer` `seo-specialist` `technical-writer` `prompt-engineer` `research-analyst` `trend-analyst`

### Specialized Domains (10+)
`blockchain-developer` `fintech-engineer` `game-developer` `iot-engineer` `embedded-systems` `mobile-developer` `fullstack-developer` `backend-developer` `incident-responder` `search-specialist` `wordpress-master`

</details>

---

## Keeping It In Sync

### After changing agents/skills/commands locally:

```bash
cd ~/claude-superpower
bash sync.sh                              # Pull from ~/.claude/ → repo
git add -A && git commit -m "Sync updates"
git push
```

### On another machine:

```bash
cd ~/claude-superpower
git pull
bash install.sh    # Deploy to ~/.claude/
```

---

## Repo Structure

```
claude-superpower/
├── agents/              # 146 specialist subagent prompts (.md)
├── skills/              # 8 orchestrator skill directories
│   ├── workflow-runner/   # + references/chains.md
│   ├── smart-commit/
│   ├── deep-review/
│   ├── debug-flow/
│   ├── project-context/   # user-invocable: false (background)
│   ├── agent-guide/       # user-invocable: false (background)
│   ├── scaffold/          # + references/templates.md
│   └── impact-check/
├── commands/
│   ├── general/           # 6: code-review, creative-writer, data-analyst, etc.
│   ├── ui/                # 9: design-system, react-component, mobile-design, etc.
│   ├── gsd/               # 31: project management commands
│   └── subagent-catalog/  # 5: list, search, fetch, invalidate
├── config/
│   ├── CLAUDE.md                    # Master auto-routing config
│   ├── claude-web-instructions.md   # For claude.ai Projects
│   └── claude-desktop-setup.md      # Desktop app guide
├── install.sh           # Bash installer (Linux/Mac/Git Bash)
├── install.ps1          # PowerShell installer (Windows)
├── sync.sh              # Sync live changes → repo
└── README.md
```

## License

MIT
