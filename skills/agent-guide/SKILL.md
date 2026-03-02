---
name: agent-guide
description: Background routing reference that provides a compact decision matrix for selecting the optimal subagent or skill for any given task. This skill should be consulted automatically before delegating work to ensure the best specialist is chosen.
user-invocable: false
---

# Agent Routing Guide

Compact routing reference for selecting the optimal subagent or skill for any task. Consult this before delegating work.

## Quick Decision: Skill vs Command vs Subagent

```
Is it a complete workflow with multiple agents?
  → Use a SKILL: /workflow-runner, /deep-review, /debug-flow, /scaffold
Does it produce a document/artifact?
  → Use a SLASH COMMAND: /code-review, /system-architect, /ui:*
Does it modify code or require deep analysis?
  → Use a SUBAGENT via Agent tool
Is it a quick commit?
  → Use SKILL: /smart-commit
Need to check change impact?
  → Use SKILL: /impact-check
```

## Orchestrator Skills (use these FIRST when applicable)

| Task Pattern | Skill | When to Use |
|-------------|-------|------------|
| Write new code end-to-end | `/workflow-runner code-gen` | User asks to implement a feature from scratch |
| Modify existing code | `/workflow-runner code-mod` | User asks to change/refactor existing code |
| Review code changes | `/deep-review` | User wants thorough multi-perspective review |
| Pre-deployment checks | `/workflow-runner deploy` | Before merging or deploying |
| Fix a bug | `/debug-flow` | User reports an error or unexpected behavior |
| Commit changes | `/smart-commit` | User wants to commit with quality checks |
| Check blast radius | `/impact-check` | Before making significant changes |
| Scaffold a project | `/scaffold` | User wants to bootstrap a new project |

## Direct Subagent Routing (when no skill matches)

### By Language
| Language | Agent | File at |
|----------|-------|---------|
| TypeScript/JS | `typescript-pro` / `javascript-pro` | `~/.claude/agents/` |
| Python | `python-pro` | `~/.claude/agents/` |
| Rust | `rust-engineer` | `~/.claude/agents/` |
| Go | `golang-pro` | `~/.claude/agents/` |
| C++ | `cpp-pro` | `~/.claude/agents/` |
| C#/.NET | `csharp-developer` | `~/.claude/agents/` |
| Java | `java-architect` | `~/.claude/agents/` |
| PHP | `php-pro` | `~/.claude/agents/` |
| Swift | `swift-expert` | `~/.claude/agents/` |
| Kotlin | `kotlin-specialist` | `~/.claude/agents/` |
| PowerShell | `powershell-7-expert` | `~/.claude/agents/` |
| SQL | `sql-pro` | `~/.claude/agents/` |
| Elixir | `elixir-expert` | `~/.claude/agents/` |

### By Domain
| Domain | Agent |
|--------|-------|
| Docker/containers | `docker-expert` |
| Kubernetes | `kubernetes-specialist` |
| Terraform | `terraform-engineer` |
| CI/CD | `devops-engineer` |
| Cloud | `cloud-architect` |
| Azure | `azure-infra-engineer` |
| Security | `security-engineer` |
| Testing/QA | `qa-expert` or `test-automator` |
| Database | `database-optimizer` or `postgres-pro` |
| ML/AI | `ml-engineer` or `llm-architect` |
| API design | `api-designer` |
| GraphQL | `graphql-architect` |
| MCP | `mcp-developer` |

### Slash Commands (for document/artifact output)
| Need | Command |
|------|---------|
| Code review report | `/code-review` |
| System design | `/system-architect` |
| Project plan | `/project-manager` |
| Research report | `/research-assistant` |
| Content writing | `/creative-writer` |
| Data analysis | `/data-analyst` |
| Design system | `/ui:design-system` |
| React component | `/ui:react-component` |
| Mobile design | `/ui:mobile-design` |

## Conflict Resolution

When multiple agents could handle a task:

1. **Skills beat subagents** — if a skill orchestrates the workflow, use it (e.g., `/debug-flow` over raw `debugger`)
2. **Framework beats language** — if working in Next.js, use `nextjs-developer` over `typescript-pro`
3. **Specific beats general** — `postgres-pro` over `sql-pro` for PostgreSQL, `react-specialist` over `frontend-developer` for React
4. **Parallel when independent** — launch code-reviewer + security-auditor + performance-engineer simultaneously
5. **Sequential when dependent** — debugger findings must inform the language-specialist fix

## Invocation Patterns

**Skills**: Use the Skill tool → `skill: "skill-name", args: "arguments"`
**Slash Commands**: Use the Skill tool → `skill: "command-name", args: "arguments"`
**Subagents**: Read `~/.claude/agents/{name}.md`, then Agent tool with `subagent_type: "general-purpose"` and the agent's instructions as the prompt
