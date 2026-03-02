---
name: refactor
description: Structured refactoring workflow with impact analysis, language-specialist execution, validation, and test verification. Use when restructuring, renaming, extracting, or simplifying code.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
---
# Refactor
Impact analysis then refactor then validate then test.
## Context
**Branch**: !`git branch --show-current 2>/dev/null || echo unknown`
**Modified**: !`git diff --name-only 2>/dev/null | head -10 || echo none`
## Usage
/refactor $ARGUMENTS
## Workflow
1. Launch change-impact-analyzer for blast radius
2. Present refactoring plan with affected files and risk
3. Launch language-specialist to execute refactoring
4. Launch output-validator to verify compilation/lint/types
5. Run existing tests to confirm no regressions
6. If validation fails, launch self-corrector (max 2 cycles)
