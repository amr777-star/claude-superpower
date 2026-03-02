---
name: workflow-runner
description: Orchestrate predefined multi-agent workflow chains as a single command. This skill should be used when the user wants to run a complete workflow chain (code generation, code modification, code review, pre-deployment, or debug & fix) that sequences multiple specialist subagents automatically.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
---

# Workflow Runner

Run complete multi-agent workflow chains with a single command, injecting live project context at every stage.

## Live Project Context

**Current branch**: !`git branch --show-current 2>/dev/null || echo "not a git repo"`
**Last commit**: !`git log --oneline -1 2>/dev/null || echo "no commits"`
**Staged files**: !`git diff --cached --name-only 2>/dev/null || echo "none"`
**Modified files**: !`git diff --name-only 2>/dev/null || echo "none"`
**Project type**: !`cat package.json 2>/dev/null | head -3 || cat pyproject.toml 2>/dev/null | head -3 || cat Cargo.toml 2>/dev/null | head -3 || cat go.mod 2>/dev/null | head -3 || echo "unknown"`

## Usage

```
/workflow-runner $ARGUMENTS
```

The argument specifies which chain to run:
- `code-gen` — Generate new code with validation
- `code-mod` — Modify existing code with impact analysis
- `review` — Parallel code review across 3 dimensions
- `deploy` — Pre-deployment quality checks
- `debug` — Full debug-and-fix cycle

If no argument is provided, analyze the current context and suggest the most appropriate chain.

## Chain Definitions

Load the full chain definitions and agent sequences from the supporting reference file:
Read `references/chains.md` in this skill directory for the complete chain specifications.

### Chain: `code-gen` (Code Generation)

**Sequence**: language-specialist → output-validator → self-corrector (if fail) → pre-commit-checker

1. **Detect language** from project context above and staged/modified files
2. **Launch the appropriate language-specialist** subagent (e.g., `typescript-pro`, `python-pro`, `rust-engineer`) from `~/.claude/agents/`. Read the agent's `.md` file and use the Agent tool with `subagent_type: "general-purpose"` to delegate the code generation task
3. **Launch output-validator** subagent to verify the generated code compiles, passes lint, and type-checks
4. **If validation fails**, launch self-corrector subagent with the validation errors to fix issues, then re-run output-validator
5. **Launch pre-commit-checker** subagent for final pre-commit validation

### Chain: `code-mod` (Code Modification)

**Sequence**: change-impact-analyzer → language-specialist → output-validator → self-corrector (if fail) → pre-commit-checker

1. **Launch change-impact-analyzer** subagent first to map the blast radius of the planned change
2. **Review the impact report** and proceed with the appropriate language-specialist subagent
3. **Launch output-validator** to verify the modifications
4. **If validation fails**, launch self-corrector then re-validate
5. **Launch pre-commit-checker** for final validation

### Chain: `review` (Code Review)

**Sequence**: code-reviewer + security-auditor + performance-engineer (all parallel)

1. **Launch all three subagents in parallel** using the Agent tool:
   - `code-reviewer` — code quality, patterns, maintainability
   - `security-auditor` — vulnerabilities, OWASP, injection risks
   - `performance-engineer` — bottlenecks, complexity, optimization
2. **Merge results** into a unified report with severity-ranked findings
3. **Present combined report** organized by severity: Critical → High → Medium → Low

### Chain: `deploy` (Pre-Deployment)

**Sequence**: quality-gate + security-auditor + change-impact-analyzer (all parallel)

1. **Launch all three subagents in parallel**:
   - `quality-gate` — test coverage, code quality gates
   - `security-auditor` — security review
   - `change-impact-analyzer` — deployment blast radius
2. **Produce deployment readiness report** with go/no-go recommendation
3. **Flag any blockers** that must be resolved before deployment

### Chain: `debug` (Debug & Fix)

**Sequence**: debugger → language-specialist → output-validator → self-corrector (if fail) → test-automator

1. **Launch debugger** subagent to identify the root cause from the error description and project context
2. **Launch appropriate language-specialist** to implement the fix based on the debugger's findings
3. **Launch output-validator** to verify the fix compiles and passes
4. **If validation fails**, launch self-corrector to iterate on the fix
5. **Launch test-automator** to create or update tests covering the bug

## Agent Invocation Pattern

To invoke each subagent:

1. Read the agent prompt from `~/.claude/agents/{agent-name}.md`
2. Use the Agent tool with `subagent_type: "general-purpose"`
3. Include the task context plus any output from previous chain steps in the prompt
4. Wait for the agent result before proceeding to the next chain step (except for parallel chains)

## Error Handling

- If any agent in the chain fails, report the failure point and partial results
- For chains with self-corrector, allow up to 2 correction cycles before reporting failure
- If a language cannot be detected, ask the user to specify
- If the chain argument is not recognized, show the available chains and ask for clarification
