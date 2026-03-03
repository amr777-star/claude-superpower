# Global Claude Code Configuration

## Agent System Overview

You have **298 specialized subagents** at `~/.claude/agents/` and **32 slash command agents** at `~/.claude/commands/`. You MUST proactively delegate work to the most appropriate agent. Do NOT do everything yourself when a specialist exists.

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
- Ruby → `ruby-pro`
- Scala → `scala-specialist`
- R → `r-analyst`
- Dart → `dart-specialist`
- Haskell → `haskell-pro`
- Lua → `lua-specialist`
- Clojure → `clojure-developer`
- Zig → `zig-engineer`
- Julia → `julia-engineer`

### 2. Framework-Specific Work
- React → `react-specialist`
- Next.js → `nextjs-developer`
- Vue → `vue-expert`
- Angular → `angular-architect`
- Svelte/SvelteKit → `svelte-developer`
- Django → `django-developer`
- Laravel → `laravel-specialist`
- Rails → `rails-expert`
- Spring Boot → `spring-boot-engineer`
- Flutter → `flutter-expert`
- Electron → `electron-pro`
- NestJS → `nestjs-developer`
- FastAPI → `fastapi-specialist`
- Remix → `remix-developer`
- Astro → `astro-developer`
- Express.js → `express-specialist`
- Flask → `flask-specialist`
- htmx → `htmx-specialist`
- React Native → `react-native-expert`
- Supabase → `supabase-specialist`
- SolidJS → `solid-developer`
- Prisma ORM → `prisma-specialist`
- Drizzle ORM → `drizzle-engineer`
- tRPC → `trpc-specialist`
- LangChain/LangGraph → `langchain-developer`
- Tauri → `tauri-developer`
- Deno → `deno-developer`
- Salesforce/Apex → `salesforce-developer`
- HubSpot → `hubspot-developer`

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
- Serverless → `serverless-architect`
- Cloudflare Workers/Pages → `cloudflare-specialist`
- GitHub Actions → `github-actions-specialist`
- Argo CD/GitOps → `argocd-specialist`
- DevSecOps → `devsecops-engineer`
- API gateways → `api-gateway-specialist`
- Release management → `release-manager`
- Pulumi IaC → `pulumi-engineer`
- GitLab CI → `gitlab-ci-specialist`
- Jenkins → `jenkins-engineer`
- CircleCI → `circleci-specialist`
- Bazel builds → `bazel-engineer`
- Crossplane → `crossplane-engineer`
- Istio service mesh → `istio-specialist`
- Consul → `consul-specialist`
- GitOps/Flux CD → `gitops-engineer`
- HashiCorp Vault → `vault-specialist`
- OpenTelemetry → `opentelemetry-engineer`
- Datadog → `datadog-engineer`
- Nx monorepo → `nx-specialist`

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
- Load testing → `load-test-engineer`
- Contract testing → `contract-test-specialist`
- Unit testing → `unit-test-specialist`
- Threat hunting → `threat-hunter`
- Malware analysis → `malware-analyst`
- Cloud security → `cloud-security-engineer`
- Application security → `appsec-engineer`
- Red team operations → `red-team-operator`
- Blue team/SOC → `blue-team-analyst`
- Digital forensics → `forensics-analyst`
- Identity/IAM security → `identity-security-architect`
- Supply chain security → `supply-chain-security-engineer`
- Container security → `container-security-specialist`
- Zero-trust architecture → `zero-trust-architect`
- AI safety/guardrails → `ai-safety-engineer`
- Property-based testing → `property-based-testing-specialist`
- Mutation testing → `mutation-testing-engineer`
- API mocking/virtualization → `api-mocking-specialist`

### 5. Data & AI
- Database queries/optimization → `sql-pro`, `postgres-pro`, or `database-optimizer`
- Database administration → `database-administrator`
- MySQL → `mysql-specialist`
- Data pipelines → `data-engineer`
- dbt transformations → `dbt-engineer`
- Apache Airflow → `airflow-engineer`
- Apache Spark → `spark-engineer`
- Machine learning → `ml-engineer` or `machine-learning-engineer`
- Computer vision → `computer-vision-engineer`
- RAG systems → `rag-specialist`
- LangChain/LangGraph → `langchain-developer`
- MLOps → `mlops-engineer`
- LLM/AI systems → `llm-architect` or `ai-engineer`
- Data analysis → `data-analyst` subagent or `/data-analyst` command
- Data science → `data-scientist`
- NLP → `nlp-engineer`
- Prompt engineering → `prompt-engineer`
- Dashboards/analytics → `dashboard-architect`
- Business intelligence → `business-intelligence-engineer`
- Real-time analytics → `real-time-analytics-engineer`
- Vector databases → `vector-database-engineer`
- Autonomous AI agents → `autonomous-agent-engineer`

### 6. Frontend & UI

#### Animation & Motion Specialists
- Framer Motion / Motion → `framer-motion-expert`
- GSAP / ScrollTrigger → `gsap-specialist`
- Lottie / Rive integration → `lottie-rive-specialist`
- Animated component patterns (Aceternity, Magic UI) → `ui-animation-library`

#### CSS & Styling Specialists
- Tailwind CSS v4 → `tailwind-expert`
- CSS-in-JS (styled-components, Emotion, vanilla-extract, Panda CSS, StyleX) → `css-in-js-specialist`
- Modern CSS patterns → `/ui:css-modern-patterns`
- CSS architecture → `/ui:css-architecture`

#### Component & Design System Specialists
- shadcn/ui components → `shadcn-ui-specialist`
- Design system architecture → `design-system-architect`
- Design tokens (W3C DTCG, Style Dictionary) → `design-token-engineer`
- Storybook documentation → `storybook-specialist`

#### Data Visualization
- Charts & dashboards (D3, Recharts, Chart.js) → `dataviz-engineer`
- Dashboard layouts → `/ui:dashboard-layout`

#### Performance & Quality
- Core Web Vitals, image/font optimization → `frontend-performance-specialist`
- Visual regression testing → `visual-regression-tester`

#### Design Intelligence
- Design trends & best practices (Dribbble, Awwwards patterns) → `design-reference`
- Current 2025-2026 design patterns: OKLCH colors, fluid clamp() typography, bento grids, glassmorphism, spring animations

#### Specialized UI Domains
- SVG creation & optimization → `svg-engineer`
- Three.js / React Three Fiber (3D) → `threejs-developer`
- Email templates (MJML, React Email) → `email-template-developer`
- Internationalization (i18n, RTL) → `i18n-specialist`

#### Slash Commands (quick generators)
- Design systems → `/ui:design-system` or `/ui:design-expert`
- React components → `/ui:react-component`
- Mobile design → `/ui:mobile-design`
- Responsive layouts → `/ui:mobile-first-layout`
- Animations → `/ui:micro-interactions`
- Accessibility (ARIA) → `/ui:aria-accessibility`
- User personas → `/ui:user-persona`
- Wireframes → `/ui:wireframe`
- Form patterns → `/ui:form-patterns`
- Data tables → `/ui:table-patterns`
- Scroll animations → `/ui:scroll-animations`
- Page transitions → `/ui:page-transitions`
- Icon systems → `/ui:icon-system`
- Multi-theme → `/ui:multi-theme`
- OG images → `/ui:og-image`
- Typography systems → `/ui:typography-system`
- Color systems → `/ui:color-system`
- PDF templates → `/ui:pdf-template`
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
- Solidity auditing → `solidity-auditor`
- DeFi protocols → `defi-developer`
- Web3 frontend/dApps → `web3-frontend-developer`
- Solana development → `solana-developer`
- Zero-knowledge proofs → `zk-engineer`
- Tokenomics design → `tokenomics-designer`
- Web3 security research → `web3-security-researcher`
- IoT → `iot-engineer`
- Game development → `game-developer`
- Fintech → `fintech-engineer`
- SEO → `seo-specialist`
- Mobile apps → `mobile-developer`
- iOS native → `ios-developer`
- Android native → `android-developer`
- React Native → `react-native-expert`
- Fullstack → `fullstack-developer`
- Backend → `backend-developer`
- Incident response → `incident-responder` or `devops-incident-responder`
- CTO/tech strategy → `cto-advisor`
- Startup tech → `startup-advisor`
- CMS/headless CMS → `cms-specialist`
- PWA → `pwa-specialist`
- Web Components → `web-components-specialist`
- Edge computing → `edge-computing-engineer`
- WebAssembly → `webassembly-engineer`
- Voice interfaces → `voice-interface-developer`
- AR/VR/XR → `ar-vr-developer`
- Digital twins → `digital-twin-engineer`
- Computer use/GUI agents → `computer-use-engineer`
- Growth engineering → `growth-engineer`
- Pricing strategy → `pricing-strategist`
- Supabase Realtime → `supabase-realtime-engineer`

### 11. Rust Specializations
- Rust web (Axum/Actix) → `rust-web-developer`
- Rust systems/kernel → `rust-systems-programmer`
- Rust embedded → `rust-embedded-developer`
- Rust WASM → `rust-wasm-developer`
- Rust blockchain → `rust-blockchain-developer`

### 12. Payments
- Payment architecture → `payment-architect`
- Stripe integration → `stripe-specialist`
- Crypto payments → `crypto-payments-developer`

### 13. Integrations & Communication
- Microsoft Teams → `microsoft-teams-developer`
- Twilio (SMS/Voice/Video) → `twilio-specialist`
- Zapier automations → `zapier-specialist`
- Slack apps → `slack-expert`

### 14. Orchestration
- Maestro (memory-enhanced brain) → `maestro` (opus model)
- Maestro sub-agents → `maestro-researcher`, `maestro-planner`, `maestro-executor`, `maestro-reviewer`, `maestro-memory-manager`

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

### Slash Commands (32 total, invoke with /)
**General** (10): `/code-review`, `/creative-writer`, `/data-analyst`, `/project-manager`, `/research-assistant`, `/system-architect`, `/test-gen`, `/explain`, `/security-scan`, `/perf-audit`
**UI** (22): `/ui:design-system`, `/ui:design-expert`, `/ui:mobile-design`, `/ui:react-component`, `/ui:css-architecture`, `/ui:user-persona`, `/ui:micro-interactions`, `/ui:mobile-first-layout`, `/ui:aria-accessibility`, `/ui:wireframe`, `/ui:form-patterns`, `/ui:table-patterns`, `/ui:scroll-animations`, `/ui:css-modern-patterns`, `/ui:page-transitions`, `/ui:dashboard-layout`, `/ui:icon-system`, `/ui:multi-theme`, `/ui:og-image`, `/ui:typography-system`, `/ui:color-system`, `/ui:pdf-template`

### Subagents (298 total, in `~/.claude/agents/`)
**Browse**: `/subagent-catalog:list`, `/subagent-catalog:search <query>`, `/subagent-catalog:fetch <name>`

## Code Generation Guardrails

ALWAYS follow these rules when generating or modifying code. These prevent the most common AI coding mistakes.

### Correctness
- After generating any function with loops, conditionals, or async operations, trace through at least 3 edge cases: empty input, single element, and boundary value before presenting code
- NEVER present code without considering what happens when the input is null, empty, zero, negative, or at maximum value

### Security
- NEVER generate string-interpolated SQL — ALWAYS use parameterized queries
- NEVER hardcode secrets, API keys, or passwords — use environment variables
- NEVER use eval() or exec() with any external input
- ALWAYS sanitize user input before rendering in HTML
- ALWAYS validate and sanitize all API inputs at system boundaries

### Simplicity
- ALWAYS prefer the simplest solution that solves the stated problem
- Never create a class when a function will do. Never create a library when a module will do
- When the user says "simple", "quick", "script", or "prototype", constrain to single-file solutions with no external dependencies unless explicitly required

### Dependencies
- Before importing ANY library or using ANY API, check the project's package.json / requirements.txt / Cargo.toml for the ACTUAL installed version
- NEVER assume a library is installed — verify first
- Use API methods compatible with the project's actual dependency versions, not the latest version

### Breaking Changes
- Before modifying any function signature, exported interface, API endpoint, or database schema, search for ALL callers/consumers using Grep
- NEVER present a partial change that leaves callers broken — update all callers in the same change set

### Error Handling
- NEVER use empty catch blocks — ALWAYS include a descriptive error message with context
- ALWAYS clean up resources in finally blocks
- For API endpoints, ALWAYS return consistent error response shapes
- For async code, ALWAYS handle rejections

### Test Quality
- EVERY test must have at least one meaningful assertion
- Test BEHAVIOR (inputs and outputs), not implementation (internal method calls)
- Include at least one error/edge case test for every happy path test
- NEVER mock the module under test

### Git Discipline
- NEVER use `git add .` or `git add -A` — always stage specific files by name
- Each commit should contain ONE logical change
- NEVER force-push to main/master
- NEVER commit .env, credentials, or key files

### Configuration
- ALL hostnames, ports, credentials, and URLs must come from environment variables
- Docker containers must NOT run as root
- ALWAYS generate separate configs for dev/staging/prod when applicable
