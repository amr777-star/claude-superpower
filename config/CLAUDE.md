# Global Claude Code Configuration

## Agent System Overview

You have **135+ specialized subagents** at `~/.claude/agents/` and **15 slash command agents** at `~/.claude/commands/`. You MUST proactively delegate work to the most appropriate agent. Do NOT do everything yourself when a specialist exists.

## Slash Command vs Subagent Decision

| Aspect | Slash Commands (`/`) | Subagents (Agent tool) |
|--------|---------------------|----------------------|
| **Purpose** | Quick generators — produce structured output | Deep workers — read, write, analyze, modify |
| **Interaction** | User invokes directly, gets formatted result | Claude routes automatically based on task |
| **Context** | Receives user prompt + $ARGUMENTS | Receives full conversation context |
| **When to use** | User asks for a deliverable (report, plan, design, review) | Task requires multi-step codebase work |
| **Examples** | `/code-review`, `/project-manager`, `/ui:design-system` | `typescript-pro`, `debugger`, `security-auditor` |

**Rule of thumb**: If the output is a document/artifact, use the slash command. If the task modifies code or requires deep analysis, use a subagent.

## Workflow Chains

For multi-step workflows, run agents in sequence. Launch independent steps in parallel where possible.

### Code Generation (new code)
```
language-specialist → output-validator → self-corrector (if fail) → pre-commit-checker
```

### Code Modification (changing existing code)
```
change-impact-analyzer → language-specialist → output-validator → self-corrector (if fail) → pre-commit-checker
```

### Code Review
```
code-reviewer → security-auditor → performance-engineer
```
(Launch all 3 in parallel for speed)

### Pre-Deployment
```
quality-gate → security-auditor → change-impact-analyzer
```

### Debug & Fix
```
debugger → language-specialist → output-validator → self-corrector (if fail) → test-automator
```

## Auto-Trigger Rules

ALWAYS automatically delegate when the task matches an agent's expertise:

### 1. Language-Specific Code
When writing, debugging, or reviewing code in a specific language:
- TypeScript/JavaScript → `typescript-pro` or `javascript-pro`
- Python → `python-pro`
- Rust → `rust-engineer`
- Go → `golang-pro`
- C++ → `cpp-pro`
- C#/.NET → `csharp-developer` or `dotnet-core-expert`
- Java → `java-architect`
- PHP → `php-pro`
- Swift → `swift-expert`
- Kotlin → `kotlin-specialist`
- PowerShell → `powershell-7-expert` or `powershell-5.1-expert`
- SQL → `sql-pro`
- Elixir → `elixir-expert`

### 2. Framework-Specific Work
- React → `react-specialist`
- Next.js → `nextjs-developer`
- Vue → `vue-expert`
- Angular → `angular-architect`
- Django → `django-developer`
- Laravel → `laravel-specialist`
- Rails → `rails-expert`
- Spring Boot → `spring-boot-engineer`
- Flutter → `flutter-expert`
- Electron → `electron-pro`

### 3. Infrastructure & DevOps
- Docker/containers → `docker-expert`
- Kubernetes → `kubernetes-specialist`
- Terraform → `terraform-engineer`
- Terragrunt → `terragrunt-expert`
- CI/CD pipelines → `devops-engineer` or `deployment-engineer`
- Cloud architecture → `cloud-architect`
- Azure → `azure-infra-engineer`
- Site reliability → `sre-engineer`
- Network issues → `network-engineer`
- Platform engineering → `platform-engineer`
- Windows infrastructure → `windows-infra-admin`

### 4. Quality, Security & Validation
- Code review → `code-reviewer`
- Security audit → `security-auditor`
- Security engineering → `security-engineer`
- AD security → `ad-security-reviewer`
- PowerShell hardening → `powershell-security-hardening`
- Penetration testing → `penetration-tester`
- Compliance → `compliance-auditor`
- Performance optimization → `performance-engineer`
- Testing/QA → `qa-expert` or `test-automator`
- Debugging → `debugger` or `error-detective`
- Accessibility → `accessibility-tester`
- Architecture review → `architect-reviewer`
- Chaos engineering → `chaos-engineer`
- **Output validation → `output-validator`** (after code generation)
- **Self-correction → `self-corrector`** (after validation failure)
- **Quality gate → `quality-gate`** (before commit/deploy)
- **Pre-commit check → `pre-commit-checker`** (before each commit)
- **Change impact → `change-impact-analyzer`** (before significant changes)

### 5. Data & AI
- Database queries/optimization → `sql-pro`, `postgres-pro`, or `database-optimizer`
- Database administration → `database-administrator`
- Data pipelines → `data-engineer`
- Machine learning → `ml-engineer` or `machine-learning-engineer`
- MLOps → `mlops-engineer`
- LLM/AI systems → `llm-architect` or `ai-engineer`
- Data analysis → `data-analyst` subagent or `/data-analyst` command
- Data science → `data-scientist`
- NLP → `nlp-engineer`
- Prompt engineering → `prompt-engineer`

### 6. Frontend & UI (slash commands for quick generation)
- Design systems → `/ui:design-system` or `/ui:design-expert`
- React components → `/ui:react-component`
- Mobile design → `/ui:mobile-design`
- Responsive layouts → `/ui:mobile-first-layout`
- CSS architecture → `/ui:css-architecture`
- Animations → `/ui:micro-interactions`
- Accessibility (ARIA) → `/ui:aria-accessibility`
- User personas → `/ui:user-persona`
- UI design (subagent) → `ui-designer`
- Frontend dev (subagent) → `frontend-developer`

### 7. Architecture & API
- System design → `/system-architect` or `microservices-architect`
- API design → `api-designer`
- GraphQL → `graphql-architect`
- WebSocket → `websocket-engineer`
- MCP servers → `mcp-developer`

### 8. Business & Product (slash commands for deliverables)
- Project planning → `/project-manager`
- Research → `/research-assistant`
- Content writing → `/creative-writer`
- Data analysis report → `/data-analyst`
- Code review report → `/code-review`

### 9. Developer Tooling
- Build systems → `build-engineer`
- CLI tools → `cli-developer`
- Dependency management → `dependency-manager`
- Documentation → `documentation-engineer`
- DX optimization → `dx-optimizer`
- Git workflows → `git-workflow-manager`
- Legacy modernization → `legacy-modernizer`
- Refactoring → `refactoring-specialist`
- PowerShell modules → `powershell-module-architect`
- PowerShell UI → `powershell-ui-architect`

### 10. Specialized Domains
- Blockchain/Web3 → `blockchain-developer`
- IoT → `iot-engineer`
- Game development → `game-developer`
- Fintech → `fintech-engineer`
- SEO → `seo-specialist`
- Mobile apps → `mobile-developer`
- Fullstack → `fullstack-developer`
- Backend → `backend-developer`
- Incident response → `incident-responder` or `devops-incident-responder`

## Orchestrator Skills (8 total, use FIRST when applicable)

Skills sit above subagents and slash commands as intelligent orchestrators. They inject live context via `!`command`` preprocessing, chain multiple agents, and use advanced features (forked context, argument handling, background auto-context).

### Workflow Orchestrators (user-invocable)

| Skill | Command | What It Does |
|-------|---------|-------------|
| **workflow-runner** | `/workflow-runner <chain>` | Runs predefined chains: `code-gen`, `code-mod`, `review`, `deploy`, `debug` |
| **smart-commit** | `/smart-commit [--quick\|--amend]` | Pre-commit validation + commit message generation + git commit |
| **deep-review** | `/deep-review [files\|PR#\|range]` | Parallel code-reviewer + security-auditor + performance-engineer (forked context) |
| **debug-flow** | `/debug-flow <error>` | debugger → language-specialist → output-validator → self-corrector |

### Power Tools (user-invocable)

| Skill | Command | What It Does |
|-------|---------|-------------|
| **scaffold** | `/scaffold <type> <description>` | Architecture + design system + code gen + validation for new projects |
| **impact-check** | `/impact-check [files\|--plan "desc"]` | Quick blast-radius analysis via change-impact-analyzer (forked context) |

### Auto-Context Providers (background, not user-invocable)

| Skill | Purpose |
|-------|---------|
| **project-context** | Silently injects git state, project type, directory structure into all conversations |
| **agent-guide** | Background routing reference — compact decision matrix for agent selection |

### Skill Priority Rules

1. **Skills beat raw agents** — use `/debug-flow` over manually launching `debugger`
2. **Orchestrators beat singles** — use `/workflow-runner review` over launching `code-reviewer` alone
3. **Forked skills for analysis** — use `/deep-review` and `/impact-check` to keep verbose analysis isolated
4. **Auto-context is always active** — `project-context` and `agent-guide` are `user-invocable: false` background skills

### Updated Workflow Entry Points

The workflow chains defined above now have skill entry points:

| Chain | Direct Agent Sequence | Skill Entry Point |
|-------|----------------------|-------------------|
| Code Generation | language-specialist → output-validator → ... | `/workflow-runner code-gen` |
| Code Modification | change-impact-analyzer → language-specialist → ... | `/workflow-runner code-mod` |
| Code Review | code-reviewer + security-auditor + performance-engineer | `/deep-review` or `/workflow-runner review` |
| Pre-Deployment | quality-gate + security-auditor + change-impact-analyzer | `/workflow-runner deploy` |
| Debug & Fix | debugger → language-specialist → ... | `/debug-flow` |

## How to Route

1. **Orchestrator skills** → Use when the task matches a workflow chain (highest priority)
2. **Slash commands** → Use the **Skill tool** to invoke them (e.g., `/code-review`, `/ui:design-system`)
3. **Subagents** → Use the **Agent tool** with `subagent_type: "general-purpose"` and load the agent's prompt from `~/.claude/agents/[name].md`
4. **Multi-domain tasks** → Launch multiple agents in parallel when tasks are independent
5. **Workflow chains** → Use skill entry points (preferred) or run agents in sequence directly

## When NOT to Auto-Route
- Simple one-line fixes or trivial changes
- Quick questions that don't need specialist depth
- When the user explicitly says they want to handle it themselves
- When the task is too small to justify agent overhead (< 5 lines of code, single obvious change)

## Installed Agent Inventory

### Orchestrator Skills (8 total, in `~/.claude/skills/`)
**Workflows** (4): `/workflow-runner`, `/smart-commit`, `/deep-review`, `/debug-flow`
**Power Tools** (2): `/scaffold`, `/impact-check`
**Background** (2): `project-context` (auto-context), `agent-guide` (routing reference)

### Slash Commands (15 total, invoke with /)
**General** (6): `/code-review`, `/creative-writer`, `/data-analyst`, `/project-manager`, `/research-assistant`, `/system-architect`
**UI** (9): `/ui:design-system`, `/ui:design-expert`, `/ui:mobile-design`, `/ui:react-component`, `/ui:css-architecture`, `/ui:user-persona`, `/ui:micro-interactions`, `/ui:mobile-first-layout`, `/ui:aria-accessibility`

### Subagents (135+ total, in `~/.claude/agents/`)
**Browse**: `/subagent-catalog:list`, `/subagent-catalog:search <query>`, `/subagent-catalog:fetch <name>`
