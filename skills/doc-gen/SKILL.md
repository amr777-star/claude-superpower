---
name: doc-gen
description: Generate documentation from code including API docs, architecture overviews, README content, and inline docs. Use when documenting existing code or generating API reference.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
---
# Documentation Generator
Scan codebase then produce docs in requested format.
## Context
**Structure**: !`ls -1 2>/dev/null | head -15 || echo empty`
**Existing docs**: !`ls README* CHANGELOG* docs/ 2>/dev/null || echo none`
## Usage
/doc-gen $ARGUMENTS
## Workflow
1. Scan relevant source files for structure and behavior
2. Detect existing documentation style
3. Generate in requested format (API reference, architecture, README, module docs)
4. Validate code references are accurate
