---
name: scaffold
description: Project scaffolding that combines architecture planning, design system generation, and framework-specialist code generation into a single workflow. This skill should be used when the user wants to bootstrap a new project or major feature from scratch with proper architecture, design, and implementation.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
---

# Scaffold

Full project scaffolding: architecture → design system → code generation → validation.

## Current Directory State

!`ls -1 2>/dev/null | head -15 || echo "empty directory"`
!`git status --short 2>/dev/null | head -5 || echo "not a git repo"`

## Usage

```
/scaffold $ARGUMENTS
```

**Argument format**: `<project-type> <description>`

**Examples**:
```
/scaffold react-app todo app with authentication and dark mode
/scaffold next-app e-commerce dashboard with product management
/scaffold python-api REST API for inventory management with PostgreSQL
/scaffold node-api GraphQL API for social media feeds
/scaffold rust-cli command-line tool for log analysis
```

**Supported project types**: See the `references/templates.md` file for the full list with starter configurations.

## Workflow

### Step 1: Architecture Planning

1. Parse `$ARGUMENTS` to extract project type and description
2. Invoke the `/system-architect` skill via the Skill tool with the project description
3. The architect will produce:
   - System components and their responsibilities
   - Data flow and API boundaries
   - Technology choices and justifications
   - File/directory structure plan

### Step 2: Design System (for frontend projects)

If the project type includes a frontend (react-app, next-app, vue-app, etc.):

1. Invoke the `/ui:design-system` skill via the Skill tool with the project description and architecture from Step 1
2. The design system will specify:
   - Color palette and typography
   - Component hierarchy
   - Layout patterns
   - Responsive breakpoints

Skip this step for backend-only projects (python-api, node-api, rust-cli, etc.).

### Step 3: Code Generation

1. Determine the primary language from the project type
2. Read the template configuration from `references/templates.md` for the project type
3. Read the appropriate language-specialist agent prompt from `~/.claude/agents/`
4. Launch the language-specialist subagent via Agent tool with `subagent_type: "general-purpose"`, providing:
   - The architecture plan from Step 1
   - The design system from Step 2 (if applicable)
   - The template configuration for the project type
   - The project description from `$ARGUMENTS`
5. The specialist generates:
   - Project structure (directories and files)
   - Configuration files (linter, formatter, CI, etc.)
   - Core implementation files
   - Basic test setup

### Step 4: Validation

1. Read the `output-validator` agent prompt from `~/.claude/agents/output-validator.md`
2. Launch the output-validator subagent to verify:
   - Project builds/compiles successfully
   - Linting passes
   - Tests run (even if minimal)
   - No obvious issues
3. If validation fails, launch `self-corrector` to fix issues and re-validate

### Step 5: Summary

Present a summary of what was created:
- Architecture decisions made
- Files and directories created
- How to run the project (dev server, tests, build)
- Suggested next steps

## Error Handling

- If the project type is not recognized, show available types from `references/templates.md` and ask the user to choose
- If the directory is not empty, warn the user and ask for confirmation before proceeding
- If architecture planning suggests the scope is too large, break it into phases and ask the user which to start with
