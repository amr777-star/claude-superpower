---
name: impact-check
description: Quick blast-radius analysis of current or planned changes by running the change-impact-analyzer subagent in an isolated forked context. This skill should be used before making significant code changes, refactors, or deployments to understand what will be affected.
context: fork
allowed-tools: Read, Bash, Glob, Grep
---

# Impact Check

Quick blast-radius analysis of changes, running in isolated context to keep verbose analysis out of the main conversation.

## Current Changes

**Staged changes**:
!`git diff --cached --stat 2>/dev/null || echo "nothing staged"`

**Unstaged changes**:
!`git diff --stat 2>/dev/null || echo "no unstaged changes"`

**Current branch**:
!`git branch --show-current 2>/dev/null || echo "unknown"`

**Changed files detail**:
!`git diff --cached --name-status 2>/dev/null || git diff --name-status 2>/dev/null || echo "no changes"`

## Usage

```
/impact-check $ARGUMENTS
```

**Arguments** (optional):
- No arguments — analyze staged or unstaged changes
- File paths — analyze impact of changes to specific files
- `--plan "description"` — analyze the theoretical impact of a planned change before making it

## Workflow

### Step 1: Determine Change Scope

1. If `$ARGUMENTS` contains `--plan`, use the description as the change to analyze (no actual diff needed)
2. If `$ARGUMENTS` contains file paths, focus analysis on those files
3. If no arguments, use the staged diff (preferred) or unstaged diff from the context above

### Step 2: Run Impact Analysis

1. Read the `change-impact-analyzer` agent prompt from `~/.claude/agents/change-impact-analyzer.md`
2. Launch the change-impact-analyzer subagent via Agent tool with `subagent_type: "general-purpose"`, providing:
   - The diff or planned change description
   - The list of changed files
   - The project structure context
3. The analyzer maps:
   - **Direct dependencies**: files that import/use the changed code
   - **Indirect dependencies**: files that depend on direct dependencies
   - **Test coverage**: which tests exercise the changed code
   - **API surface**: whether public interfaces are affected
   - **Configuration impact**: whether config, env, or build changes propagate

### Step 3: Return Concise Summary

Present a clean blast-radius summary to the main conversation:

```markdown
## Impact Analysis

### Blast Radius: [Small/Medium/Large/Critical]

### Direct Impact (N files)
- `path/to/file.ts` — [what's affected]
- `path/to/other.ts` — [what's affected]

### Indirect Impact (N files)
- `path/to/dependent.ts` — depends on changed module

### Test Coverage
- [X] tests cover this change / [ ] no test coverage for changed code
- Tests to run: `npm test -- path/to/test`

### Risk Assessment
- **Breaking changes**: [Yes/No — details]
- **API surface affected**: [Yes/No — details]
- **Migration needed**: [Yes/No — details]

### Recommendation
[Proceed / Proceed with caution / Add tests first / Needs review]
```

## Notes

- This skill runs in forked context (`context: fork`) to keep verbose analysis isolated from the main conversation
- Only the concise summary is returned
- For full workflow with automatic fixes, use `/workflow-runner code-mod` instead
- Pair with `/deep-review` for comprehensive pre-merge checks
