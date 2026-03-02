---
name: project-context
description: Silently provides live project metadata and environment context to enhance all agent interactions. This skill injects git state, project type, directory structure, and development environment information so agents start informed instead of spending turns discovering basic project facts.
user-invocable: false
---

# Project Context

This background context is automatically available. Use it to inform all subsequent agent interactions and code generation tasks.

## Repository State

**Git root**: !`git rev-parse --show-toplevel 2>/dev/null || echo "not a git repo"`
**Current branch**: !`git branch --show-current 2>/dev/null || echo "not a git repo"`
**Recent commits**:
!`git log --oneline -3 2>/dev/null || echo "no commits"`
**Uncommitted changes**: !`git status --short 2>/dev/null | head -10 || echo "not a git repo"`

## Project Type Detection

**Manifest file**:
!`cat package.json 2>/dev/null | head -5 || cat pyproject.toml 2>/dev/null | head -5 || cat Cargo.toml 2>/dev/null | head -5 || cat go.mod 2>/dev/null | head -5 || cat pom.xml 2>/dev/null | head -5 || cat build.gradle 2>/dev/null | head -3 || cat composer.json 2>/dev/null | head -5 || cat Gemfile 2>/dev/null | head -5 || cat mix.exs 2>/dev/null | head -5 || echo "no manifest found"`

## Directory Structure

**Top-level files and directories**:
!`ls -1 2>/dev/null | head -20 || echo "empty or inaccessible"`

## Project Type Rules

Based on the manifest and directory structure above, determine the project type:

| Signal | Project Type | Primary Language | Agent |
|--------|-------------|-----------------|-------|
| `package.json` + `tsconfig.json` | Node/TypeScript | TypeScript | `typescript-pro` |
| `package.json` without `tsconfig` | Node/JavaScript | JavaScript | `javascript-pro` |
| `pyproject.toml` or `requirements.txt` | Python | Python | `python-pro` |
| `Cargo.toml` | Rust | Rust | `rust-engineer` |
| `go.mod` | Go | Go | `golang-pro` |
| `pom.xml` or `build.gradle` | Java/JVM | Java | `java-architect` |
| `.csproj` or `.sln` | .NET | C# | `csharp-developer` |
| `composer.json` | PHP | PHP | `php-pro` |
| `Gemfile` | Ruby | Ruby | `rails-expert` |
| `mix.exs` | Elixir | Elixir | `elixir-expert` |
| `Package.swift` | Swift | Swift | `swift-expert` |
| `CMakeLists.txt` | C/C++ | C++ | `cpp-pro` |

## Framework Detection

| Signal | Framework | Agent |
|--------|-----------|-------|
| `next.config` or `@next/` in deps | Next.js | `nextjs-developer` |
| `react` in deps without next | React | `react-specialist` |
| `vue` in deps | Vue | `vue-expert` |
| `@angular/core` in deps | Angular | `angular-architect` |
| `django` in deps | Django | `django-developer` |
| `laravel` in deps | Laravel | `laravel-specialist` |
| `rails` in Gemfile | Rails | `rails-expert` |
| `spring-boot` in deps | Spring Boot | `spring-boot-engineer` |
| `flutter` in deps | Flutter | `flutter-expert` |
| `electron` in deps | Electron | `electron-pro` |

## Usage Instructions

This context is injected silently. When delegating to any subagent:
- Include the detected project type and language so the agent doesn't waste turns discovering it
- Reference the branch and recent commits for change context
- Use the directory structure to inform file discovery
