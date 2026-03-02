---
name: debug-flow
description: End-to-end debug workflow that chains debugger, language-specialist, output-validator, and self-corrector subagents to find a bug's root cause, implement a fix, and verify it works. This skill should be used when the user reports a bug, error, or unexpected behavior that needs systematic investigation and resolution.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
---

# Debug Flow

End-to-end debugging workflow: find root cause → implement fix → validate → self-correct if needed.

## Project Context

**Recent changes** (potential regression source):
!`git diff --name-only HEAD~3 2>/dev/null || echo "no recent changes"`

**Recent commits**:
!`git log --oneline -5 2>/dev/null || echo "no commit history"`

**Current branch**:
!`git branch --show-current 2>/dev/null || echo "unknown"`

**Project type**:
!`cat package.json 2>/dev/null | head -3 || cat pyproject.toml 2>/dev/null | head -3 || cat Cargo.toml 2>/dev/null | head -3 || echo "unknown"`

## Usage

```
/debug-flow $ARGUMENTS
```

**Arguments**: Error message, stack trace, or description of the unexpected behavior. Include as much detail as possible.

Example:
```
/debug-flow TypeError: Cannot read property 'map' of undefined in UserList component
/debug-flow Tests failing in auth module after recent refactor
/debug-flow App crashes on startup with exit code 1
```

## Workflow

### Step 1: Root Cause Analysis (Debugger)

1. Read the `debugger` agent prompt from `~/.claude/agents/debugger.md`
2. Launch the debugger subagent via Agent tool with `subagent_type: "general-purpose"`, providing:
   - The error description from `$ARGUMENTS`
   - Recent changes and commits from the live context above
   - Project type information
3. The debugger will:
   - Reproduce or trace the error
   - Identify the root cause
   - Pinpoint the exact file(s) and line(s) responsible
   - Produce a root cause analysis report

### Step 2: Implement Fix (Language Specialist)

1. Detect the language from the files identified in Step 1 and the project context
2. Read the appropriate language-specialist agent prompt from `~/.claude/agents/`:
   - TypeScript → `typescript-pro.md`
   - Python → `python-pro.md`
   - Rust → `rust-engineer.md`
   - Go → `golang-pro.md`
   - (See `~/.claude/skills/workflow-runner/references/chains.md` for full mapping)
3. Launch the language-specialist subagent, providing:
   - The root cause analysis from Step 1
   - The specific files and lines to modify
   - The expected behavior
4. The specialist will implement the minimal fix

### Step 3: Validate Fix (Output Validator)

1. Read the `output-validator` agent prompt from `~/.claude/agents/output-validator.md`
2. Launch the output-validator subagent, providing:
   - The modified files from Step 2
   - The original error for regression checking
3. The validator checks:
   - Code compiles/passes syntax check
   - Linting passes
   - Type checking passes
   - Existing tests pass
   - The original error no longer occurs

### Step 4: Self-Correct if Needed

If the output-validator reports failures:

1. Read the `self-corrector` agent prompt from `~/.claude/agents/self-corrector.md`
2. Launch the self-corrector subagent, providing:
   - The validation errors from Step 3
   - The current state of the modified files
   - The original root cause analysis
3. Re-run the output-validator (Step 3) on the corrected code
4. Allow up to 2 correction cycles. If still failing after 2 cycles, report the remaining issues to the user

### Step 5: Report Results

Present a summary:
- **Root cause**: what was wrong and why
- **Fix applied**: what changed (files, lines)
- **Validation**: pass/fail status
- **Tests**: whether existing tests pass, and suggest new test cases if none cover the bug

## Error Handling

- If the debugger cannot identify a root cause, present its findings and ask the user for more context
- If the language cannot be detected, ask the user to specify
- If validation keeps failing after self-correction cycles, present the partial fix and remaining issues
