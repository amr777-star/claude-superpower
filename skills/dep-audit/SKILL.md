---
name: dep-audit
description: Audit dependencies for outdated packages, security vulnerabilities, unused deps, and upgrade compatibility.
context: fork
allowed-tools: Read, Bash, Glob, Grep
---
# Dependency Audit
Outdated then vulnerable then unused then upgrade plan.
## Context
**Manifest**: !`cat package.json 2>/dev/null | head -20 || cat requirements.txt 2>/dev/null | head -20 || echo unknown`
## Usage
/dep-audit $ARGUMENTS
## Workflow
1. Read manifest and lock file
2. Check outdated packages
3. Scan for known vulnerabilities
4. Cross-reference imports vs installed to find unused
5. Produce prioritized upgrade report
