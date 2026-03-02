---
name: deep-review
description: Launch parallel code review across three dimensions — code quality, security, and performance — by orchestrating three specialist subagents simultaneously. This skill should be used when the user wants a thorough, multi-perspective review of code changes, a PR, or a commit range.
context: fork
allowed-tools: Read, Bash, Glob, Grep
---

# Deep Review

Comprehensive parallel code review combining code-reviewer, security-auditor, and performance-engineer subagents into a unified severity-ranked report.

## Changes to Review

**Diff** (latest commit or staged):
!`git diff --cached --stat 2>/dev/null || git diff HEAD~1 --stat 2>/dev/null || echo "no changes detected"`

!`git diff --cached 2>/dev/null || git diff HEAD~1 2>/dev/null || echo "no diff available"`

## Usage

```
/deep-review $ARGUMENTS
```

**Arguments** (optional):
- No arguments — review latest commit or staged changes
- File paths — review specific files only
- `HEAD~N` or commit range — review a specific range (e.g., `HEAD~3..HEAD`)
- PR number — review a pull request (uses `gh pr diff`)

## Workflow

### Step 1: Determine Review Scope

1. If `$ARGUMENTS` contains a PR number, fetch the diff: `gh pr diff <number>`
2. If `$ARGUMENTS` contains a commit range, use `git diff <range>`
3. If `$ARGUMENTS` contains file paths, use `git diff HEAD -- <paths>`
4. If no arguments, use the live diff injected above

### Step 2: Launch Parallel Reviews

Launch all three subagents **simultaneously** using three parallel Agent tool calls with `subagent_type: "general-purpose"`:

**Agent 1: Code Reviewer** (`~/.claude/agents/code-reviewer.md`)
- Focus: code quality, patterns, maintainability, DRY, SOLID, naming, complexity
- Include the diff and relevant file contents in the prompt

**Agent 2: Security Auditor** (`~/.claude/agents/security-auditor.md`)
- Focus: OWASP Top 10, injection, XSS, auth issues, secrets exposure, dependency vulns
- Include the diff and any security-relevant context

**Agent 3: Performance Engineer** (`~/.claude/agents/performance-engineer.md`)
- Focus: algorithmic complexity, memory leaks, N+1 queries, unnecessary allocations, caching opportunities
- Include the diff and any performance-relevant context

### Step 3: Merge and Rank Results

1. Collect findings from all three agents
2. Deduplicate overlapping findings (e.g., both code-reviewer and security-auditor flag the same issue)
3. Assign unified severity: **Critical** > **High** > **Medium** > **Low** > **Info**
4. Group by severity, then by review dimension

### Step 4: Present Unified Report

Format the final report as:

```markdown
# Deep Review Report

## Summary
- **Files reviewed**: N
- **Total findings**: N (Critical: N, High: N, Medium: N, Low: N)
- **Overall risk**: [Low/Medium/High/Critical]

## Critical Findings
### [Finding title] (Source: Security/Code/Performance)
- **File**: path/to/file:line
- **Issue**: description
- **Fix**: suggested remediation

## High Findings
...

## Medium Findings
...

## Low Findings
...

## Positive Observations
- Things done well that should be continued
```

## Notes

- This skill runs in forked context (`context: fork`) to keep verbose analysis isolated
- The final report is returned to the main conversation as a clean summary
- For quick single-dimension reviews, use the individual subagents directly instead
