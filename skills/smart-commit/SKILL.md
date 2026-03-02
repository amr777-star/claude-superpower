---
name: smart-commit
description: Intelligent git commit workflow that analyzes staged changes, runs pre-commit validation, and generates well-crafted commit messages. This skill should be used when the user wants to commit changes with automatic quality checks and message generation.
allowed-tools: Read, Bash, Glob, Grep
---

# Smart Commit

Intelligent commit workflow with automatic pre-commit validation and commit message generation.

## Live Git State

**Staged changes summary**:
!`git diff --cached --stat 2>/dev/null || echo "nothing staged"`

**Recent commit history** (for message style matching):
!`git log --oneline -5 2>/dev/null || echo "no commits yet"`

**Current branch**:
!`git branch --show-current 2>/dev/null || echo "detached HEAD"`

**Full staged diff**:
!`git diff --cached 2>/dev/null || echo "no staged changes"`

## Usage

```
/smart-commit $ARGUMENTS
```

**Arguments** (all optional):
- No arguments — full workflow: validate → generate message → commit
- `--quick` — skip pre-commit-checker validation, just generate message and commit
- `--amend` — amend the previous commit instead of creating new one
- `--msg "message"` — use provided message instead of generating one

## Workflow

### Step 1: Validate Staged Changes

Unless `--quick` is specified:

1. Check that there are staged changes (abort if nothing staged)
2. Read the `pre-commit-checker` agent prompt from `~/.claude/agents/pre-commit-checker.md`
3. Launch the pre-commit-checker subagent via the Agent tool with `subagent_type: "general-purpose"`, providing the staged diff from the live context above
4. If the checker reports issues:
   - Display the issues to the user
   - Ask whether to proceed, fix, or abort
   - If fix: attempt to resolve issues, re-stage, and re-validate

### Step 2: Generate Commit Message

Unless `--msg` is provided:

1. Analyze the staged diff from the live context above
2. Detect the commit message convention from recent history:
   - Conventional Commits (`feat:`, `fix:`, `chore:`, etc.)
   - Descriptive (short summary + body)
   - Issue-reference style (`[PROJ-123] description`)
   - Match whatever pattern the last 5 commits follow
3. Generate a commit message that:
   - Matches the detected convention
   - Summarizes the "why" not just the "what"
   - Keeps the subject line under 72 characters
   - Adds a body paragraph for non-trivial changes
   - References related issues if detectable from branch name or diff
4. Present the generated message to the user for approval
   - Allow editing before committing

### Step 3: Execute Commit

1. If `--amend` is specified, use `git commit --amend`
2. Otherwise, create a new commit with the approved message
3. Use a HEREDOC to pass the commit message to avoid shell escaping issues:
   ```bash
   git commit -m "$(cat <<'EOF'
   <commit message>
   EOF
   )"
   ```
4. Display the commit result (hash, files changed, insertions/deletions)

## Error Handling

- **Nothing staged**: Inform the user and suggest files to stage based on `git status`
- **Pre-commit hook failure**: Report the hook output and suggest fixes
- **Merge conflict markers detected**: Warn and abort — do not commit unresolved conflicts
- **Sensitive files detected** (`.env`, credentials, keys): Warn the user and require explicit confirmation
