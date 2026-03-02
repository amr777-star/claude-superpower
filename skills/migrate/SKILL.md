---
name: migrate
description: Framework and dependency migration planner/executor. Handles version upgrades, framework switches, and language migrations step-by-step with validation.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
---
# Migrate
Scope then plan then execute stepwise then validate each step.
## Context
**Project**: !`cat package.json 2>/dev/null | head -3 || cat pyproject.toml 2>/dev/null | head -3 || echo unknown`
## Usage
/migrate $ARGUMENTS
## Workflow
1. Scope analysis: identify all files, deps, patterns needing migration
2. Migration plan: ordered steps with rollback points
3. Execute step-by-step, validate after each (build, test, lint)
4. Summary: what changed, what to test manually, known breaking changes
