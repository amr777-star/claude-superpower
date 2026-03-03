# Claude Superpower

> Turn Claude into a self-routing AI coding army — 298 specialist agents, 13 orchestrator skills, 76 slash commands, code generation guardrails — auto-triggering across **every** Claude environment.

## What's Inside

| Component | Count | Description |
|-----------|-------|-------------|
| **Subagents** | 298 | Language, framework, DevOps, security, data, Web3, UI/UX, and domain specialists |
| **Orchestrator Skills** | 13 | Workflow chains that sequence multiple agents automatically |
| **Slash Commands** | 76 | Quick generators for reviews, designs, plans, tests, UI patterns, business ops, and analysis |
| **Guardrail Rules** | 9 | CLAUDE.md rules preventing common AI coding mistakes |
| **Master Config** | 1 | CLAUDE.md with auto-routing rules across 14 categories + guardrails |
| **Web Instructions** | 1 | Portable project instructions for claude.ai |

### Slash Command Breakdown

| Category | Count | Examples |
|----------|-------|---------|
| **General** | 10 | `/code-review`, `/test-gen`, `/explain`, `/security-scan`, `/perf-audit` |
| **Business** | 8 | `/business-plan`, `/financial-modeler`, `/pitch-deck`, `/strategy-analyst`, `/fundraising-advisor`, `/market-sizing`, `/cfo-dashboard`, `/ops-planner` |
| **UI** | 22 | `/ui:design-system`, `/ui:react-component`, `/ui:mobile-design`, `/ui:wireframe`, `/ui:form-patterns` |
| **GSD** | 31 | Project management workflow (Get Shit Done system) |
| **Catalog** | 5 | Agent discovery and browsing |

## Setup Guide

### Prerequisites

- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed
- Git installed
- (Optional) VS Code or JetBrains IDE with Claude Code extension
- (Optional) [GitHub CLI](https://cli.github.com/) (`gh`) for PR/issue workflows

---

### 1. Claude Code (CLI / VS Code / JetBrains) — Full Power

This is the primary environment. All 298 agents, 13 skills, and 76 commands work here with full auto-triggering.

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
- Creates `~/.claude/agents/` with 298 specialist subagents (including 7 guardrail agents)
- Creates `~/.claude/skills/` with 13 orchestrator skills
- Creates `~/.claude/commands/` with 76 slash commands (general, business, UI, GSD, catalog)
- Installs `~/.claude/CLAUDE.md` master routing config with code generation guardrails
- Backs up any existing setup before overwriting

**Verify it works:**
```bash
claude  # Open Claude Code
# Type /workflow-runner — should autocomplete
# Type /business-plan — should autocomplete
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
- Code generation guardrails (correctness, security, simplicity, dependencies, etc.)
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
| "Create a pitch deck for Series A" | Runs `/pitch-deck` → Sequoia 12-slide framework |
| "Build a financial model" | Runs `/financial-modeler` → 3-statement, DCF, SaaS metrics |
| "Size the market for my startup" | Runs `/market-sizing` → TAM/SAM/SOM dual method |
| "Write a business plan" | Runs `/business-plan` → 12-section comprehensive plan |
| Any Python code task | Auto-routes to `python-pro` agent |
| Any Docker question | Auto-routes to `docker-expert` agent |
| Any security concern | Auto-routes to `security-auditor` or `security-engineer` agent |

### Background (always active, invisible)

| Skill | What It Does |
|-------|-------------|
| `project-context` | Injects git branch, recent commits, project type, directory structure |
| `agent-guide` | Provides routing decision matrix so the right agent is always chosen |

---

## Orchestrator Skills (13)

### Workflow Orchestrators
| Skill | Command | What It Does |
|-------|---------|-------------|
| **workflow-runner** | `/workflow-runner <chain>` | Runs: `code-gen`, `code-mod`, `review`, `deploy`, `debug` |
| **smart-commit** | `/smart-commit` | Pre-commit validation + message generation + git commit |
| **deep-review** | `/deep-review [files]` | Parallel code + security + performance review (forked context) |
| **debug-flow** | `/debug-flow <error>` | Root cause → fix → validate → test |
| **scaffold** | `/scaffold <type> <desc>` | Architecture + design + code gen for new projects |
| **impact-check** | `/impact-check` | Blast-radius analysis before changes (forked context) |

### Power Tool Skills
| Skill | Command | What It Does |
|-------|---------|-------------|
| **gen-tests** | `/gen-tests [files]` | Convention-aware test generation → quality audit |
| **refactor** | `/refactor <target>` | Impact analysis → refactor → validate → test |
| **migrate** | `/migrate <from> <to>` | Stepwise migration with rollback plan |
| **doc-gen** | `/doc-gen [scope]` | Auto-generate docs from code (API, architecture, README) |
| **dep-audit** | `/dep-audit` | Outdated + vulnerable + unused dependency scan (forked context) |

### Background Auto-Context
| Skill | What It Does |
|-------|-------------|
| **project-context** | Injects git state, project type, monorepo, CI/CD, linter, Docker, DB/ORM |
| **agent-guide** | Routing decision matrix for agent selection |

## Workflow Chains

```
Code Generation:   language-specialist → output-validator → self-corrector → pre-commit-checker
Code Modification: change-impact-analyzer → language-specialist → output-validator → self-corrector → pre-commit-checker
Code Review:       code-reviewer + security-auditor + performance-engineer (parallel)
Pre-Deployment:    quality-gate + security-auditor + change-impact-analyzer (parallel)
Debug & Fix:       debugger → language-specialist → output-validator → self-corrector → test-automator
```

---

## Business Operations Skills (8)

Comprehensive slash commands for startup and business operations — each built with deep research and real-world frameworks.

| Command | What It Generates |
|---------|------------------|
| `/business-plan` | 12-section business plan (market analysis, financials, GTM, risk assessment). Full/Lean/One-pager/Notion memo formats |
| `/financial-modeler` | 3-statement model, DCF, LBO, M&A, SaaS metrics, cap table, scenario analysis — with exact formulas and sensitivity tables |
| `/pitch-deck` | Sequoia 12-slide, YC 10-slide, Kawasaki 10/20/30 investor decks. Also: sales decks, board decks, partnership proposals. 5 storytelling frameworks (AIDA, SCQA, PAS, Minto Pyramid, Hero's Journey) |
| `/strategy-analyst` | 12 strategic frameworks: SWOT/TOWS, Porter's Five Forces, PESTEL, BCG Matrix, Ansoff, Blue Ocean ERRC, JTBD, TAM/SAM/SOM, OKRs, Value Chain, MECE Issue Trees, Competitive Positioning |
| `/fundraising-advisor` | SAFE/convertible note mechanics, term sheet analysis (economic + control terms + red flags), cap table waterfall, due diligence data room structure, investor update templates, valuation benchmarks by stage |
| `/market-sizing` | TAM/SAM/SOM dual-method (top-down + bottom-up), customer segmentation with ICP, competitive intelligence matrices, pricing research (Van Westendorp, Gabor-Granger), market entry assessment |
| `/cfo-dashboard` | 3-tier KPI architecture (North Star → Operational → Functional), monthly P&L package, 13-week rolling cash flow forecast, variance analysis framework, board financial packages, SaaS metrics dashboard |
| `/ops-planner` | OKR cascading with alignment check, capacity planning (engineering/sales/support models), DMAIC process optimization, workforce planning & comp frameworks, vendor evaluation with TCO, meeting operating system, risk register |

---

## 298 Specialist Agents

<details>
<summary>Click to see all agents by category</summary>

### Language Specialists (23)
`typescript-pro` `javascript-pro` `python-pro` `rust-engineer` `golang-pro` `cpp-pro` `csharp-developer` `java-architect` `php-pro` `swift-expert` `kotlin-specialist` `sql-pro` `elixir-expert` `dotnet-core-expert` `ruby-pro` `scala-specialist` `r-analyst` `dart-specialist` `haskell-pro` `lua-specialist` `clojure-developer` `zig-engineer` `julia-engineer`

### Framework Specialists (29)
`react-specialist` `nextjs-developer` `vue-expert` `angular-architect` `django-developer` `laravel-specialist` `rails-expert` `spring-boot-engineer` `flutter-expert` `electron-pro` `nestjs-developer` `fastapi-specialist` `svelte-developer` `remix-developer` `astro-developer` `express-specialist` `flask-specialist` `htmx-specialist` `react-native-expert` `supabase-specialist` `solid-developer` `prisma-specialist` `drizzle-engineer` `trpc-specialist` `langchain-developer` `tauri-developer` `deno-developer` `salesforce-developer` `hubspot-developer`

### DevOps & Infrastructure (31)
`docker-expert` `kubernetes-specialist` `terraform-engineer` `terragrunt-expert` `devops-engineer` `deployment-engineer` `cloud-architect` `azure-infra-engineer` `aws-architect` `gcp-architect` `sre-engineer` `network-engineer` `platform-engineer` `windows-infra-admin` `m365-admin` `it-ops-orchestrator` `devops-incident-responder` `helm-specialist` `ansible-specialist` `monitoring-specialist` `serverless-architect` `cloudflare-specialist` `github-actions-specialist` `argocd-specialist` `devsecops-engineer` `api-gateway-specialist` `release-manager` `pulumi-engineer` `gitlab-ci-specialist` `jenkins-engineer` `circleci-specialist` `bazel-engineer` `crossplane-engineer` `istio-specialist` `consul-specialist` `gitops-engineer` `vault-specialist` `opentelemetry-engineer` `datadog-engineer` `nx-specialist`

### Quality, Security & Validation (37)
`code-reviewer` `security-auditor` `security-engineer` `penetration-tester` `compliance-auditor` `performance-engineer` `qa-expert` `test-automator` `accessibility-tester` `architect-reviewer` `chaos-engineer` `output-validator` `self-corrector` `quality-gate` `pre-commit-checker` `change-impact-analyzer` `logic-verifier` `security-lint` `convention-scanner` `import-verifier` `complexity-checker` `error-handling-checker` `test-quality-auditor` `load-test-engineer` `contract-test-specialist` `unit-test-specialist` `threat-hunter` `malware-analyst` `cloud-security-engineer` `appsec-engineer` `red-team-operator` `blue-team-analyst` `forensics-analyst` `identity-security-architect` `supply-chain-security-engineer` `container-security-specialist` `zero-trust-architect` `ai-safety-engineer` `property-based-testing-specialist` `mutation-testing-engineer` `api-mocking-specialist`

### Data & AI (22)
`sql-pro` `postgres-pro` `mongodb-specialist` `redis-specialist` `elasticsearch-specialist` `database-optimizer` `database-administrator` `mysql-specialist` `data-engineer` `data-scientist` `ml-engineer` `mlops-engineer` `llm-architect` `ai-engineer` `nlp-engineer` `dbt-engineer` `airflow-engineer` `spark-engineer` `computer-vision-engineer` `rag-specialist` `dashboard-architect` `business-intelligence-engineer` `real-time-analytics-engineer` `vector-database-engineer` `autonomous-agent-engineer`

### UI/UX & Animation (18)
`framer-motion-expert` `gsap-specialist` `svg-engineer` `tailwind-expert` `shadcn-ui-specialist` `dataviz-engineer` `storybook-specialist` `frontend-performance-specialist` `design-token-engineer` `css-in-js-specialist` `design-system-architect` `threejs-developer` `email-template-developer` `i18n-specialist` `lottie-rive-specialist` `visual-regression-tester` `design-reference` `ui-animation-library`

### Frontend & UX (3)
`frontend-developer` `ui-designer` `ux-researcher`

### Architecture & API (7)
`api-designer` `api-documenter` `graphql-architect` `microservices-architect` `mcp-developer` `websocket-engineer` `kafka-architect`

### Business & Product (14)
`business-analyst` `product-manager` `scrum-master` `sales-engineer` `market-researcher` `competitive-analyst` `content-marketer` `seo-specialist` `technical-writer` `prompt-engineer` `research-analyst` `trend-analyst` `growth-engineer` `pricing-strategist`

### Developer Tooling (12)
`build-engineer` `cli-developer` `dependency-manager` `documentation-engineer` `dx-optimizer` `git-workflow-manager` `legacy-modernizer` `refactoring-specialist` `powershell-module-architect` `powershell-ui-architect` `powershell-7-expert` `powershell-5.1-expert`

### Web3 & Blockchain (8)
`blockchain-developer` `solidity-auditor` `defi-developer` `web3-frontend-developer` `solana-developer` `zk-engineer` `tokenomics-designer` `web3-security-researcher`

### Rust Specializations (5)
`rust-web-developer` `rust-systems-programmer` `rust-embedded-developer` `rust-wasm-developer` `rust-blockchain-developer`

### Payments (3)
`payment-architect` `stripe-specialist` `crypto-payments-developer`

### Integrations (5)
`microsoft-teams-developer` `twilio-specialist` `zapier-specialist` `hubspot-developer` `supabase-realtime-engineer`

### Specialized Domains (30+)
`fintech-engineer` `game-developer` `iot-engineer` `embedded-systems` `mobile-developer` `fullstack-developer` `backend-developer` `incident-responder` `search-specialist` `wordpress-master` `oauth-specialist` `e2e-test-specialist` `ios-developer` `android-developer` `cto-advisor` `startup-advisor` `cms-specialist` `pwa-specialist` `web-components-specialist` `edge-computing-engineer` `webassembly-engineer` `voice-interface-developer` `ar-vr-developer` `digital-twin-engineer` `computer-use-engineer`

### Orchestration (6)
`maestro` (opus-powered brain) `maestro-researcher` `maestro-planner` `maestro-executor` `maestro-reviewer` `maestro-memory-manager`

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
├── agents/              # 298 specialist subagent prompts (.md)
│   ├── [language]-pro.md        # 23 language specialists
│   ├── [framework]-*.md         # 29 framework specialists
│   ├── [infra]-*.md             # 31+ DevOps/infrastructure agents
│   ├── logic-verifier.md        # 7 guardrail agents
│   ├── maestro.md               # 6 orchestration agents
│   └── ...
├── skills/              # 13 orchestrator skill directories
│   ├── workflow-runner/   # + references/chains.md
│   ├── smart-commit/
│   ├── deep-review/       # context: fork
│   ├── debug-flow/
│   ├── project-context/   # user-invocable: false (background)
│   ├── agent-guide/       # user-invocable: false (background)
│   ├── scaffold/          # + references/templates.md
│   ├── impact-check/      # context: fork
│   ├── gen-tests/         # test generation
│   ├── refactor/          # structured refactoring
│   ├── migrate/           # migration workflows
│   ├── doc-gen/           # documentation generation
│   └── dep-audit/         # dependency audit (context: fork)
├── commands/
│   ├── general/           # 18: code-review, test-gen, business-plan, pitch-deck, etc.
│   ├── ui/                # 22: design-system, react-component, mobile-design, etc.
│   ├── gsd/               # 31: project management commands
│   └── subagent-catalog/  # 5: list, search, fetch, invalidate
├── config/
│   ├── CLAUDE.md                    # Master auto-routing config + guardrails
│   ├── claude-web-instructions.md   # For claude.ai Projects
│   └── claude-desktop-setup.md      # Desktop app guide
├── CLAUDE.md            # Also at repo root for reference
├── install.sh           # Bash installer (Linux/Mac/Git Bash)
├── install.ps1          # PowerShell installer (Windows)
├── sync.sh              # Sync live changes → repo
└── README.md
```

## License

MIT
