---
name: project-context
description: Silently provides live project metadata and environment context to enhance all agent interactions. Injects git state, project type, directory structure, test framework, CI/CD, monorepo, linter, Docker, and database config so agents start informed.
user-invocable: false
---

# Project Context

Automatically available background context for all agent interactions.

## Repository State
**Git root**: !`git rev-parse --show-toplevel 2>/dev/null || echo "not a git repo"`
**Current branch**: !`git branch --show-current 2>/dev/null || echo "not a git repo"`
**Recent commits**: !`git log --oneline -3 2>/dev/null || echo "no commits"`
**Uncommitted changes**: !`git status --short 2>/dev/null | head -10 || echo "not a git repo"`

## Project Type
**Manifest**: !`cat package.json 2>/dev/null | head -5 || cat pyproject.toml 2>/dev/null | head -5 || cat Cargo.toml 2>/dev/null | head -5 || cat go.mod 2>/dev/null | head -5 || cat pom.xml 2>/dev/null | head -5 || cat composer.json 2>/dev/null | head -5 || echo "no manifest"`

## Directory Structure
!`ls -1 2>/dev/null | head -20 || echo "empty"`

## Monorepo Detection
!`[ -f lerna.json ] && echo "lerna" || [ -f nx.json ] && echo "nx" || [ -f pnpm-workspace.yaml ] && echo "pnpm-workspaces" || echo "single-package"`

## Test Framework
!`grep -l jest package.json 2>/dev/null && echo "jest" || grep -l vitest package.json 2>/dev/null && echo "vitest" || [ -f pytest.ini ] && echo "pytest" || [ -f phpunit.xml ] && echo "phpunit" || echo "unknown"`

## CI/CD
!`ls .github/workflows/*.yml 2>/dev/null | head -2 || [ -f .gitlab-ci.yml ] && echo "gitlab-ci" || [ -f Jenkinsfile ] && echo "jenkins" || echo "no CI/CD"`

## Linter and Formatter
!`[ -f .eslintrc.json ] && echo "eslint" || [ -f eslint.config.js ] && echo "eslint-flat" || echo "no-eslint"; [ -f .prettierrc ] && echo "prettier" || echo ""; [ -f ruff.toml ] && echo "ruff" || echo ""`

## Docker
!`[ -f Dockerfile ] && echo "Dockerfile" || echo ""; [ -f docker-compose.yml ] && echo "docker-compose" || echo "no Docker"`

## Database/ORM
!`grep -q prisma package.json 2>/dev/null && echo "prisma" || grep -q typeorm package.json 2>/dev/null && echo "typeorm" || grep -q sqlalchemy requirements.txt 2>/dev/null && echo "sqlalchemy" || echo "unknown"`

## Environment
!`[ -f .env.example ] && echo ".env.example exists" || echo "no env template"`

## Routing Table
| Signal | Type | Agent |
|--------|------|-------|
| package.json + tsconfig | TypeScript | typescript-pro |
| package.json only | JavaScript | javascript-pro |
| pyproject.toml | Python | python-pro |
| Cargo.toml | Rust | rust-engineer |
| go.mod | Go | golang-pro |
| pom.xml / build.gradle | Java | java-architect |
| .csproj / .sln | .NET | csharp-developer |
| composer.json | PHP | php-pro |
