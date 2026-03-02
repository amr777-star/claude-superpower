# Workflow Chain Definitions

## Chain Registry

| Chain ID | Name | Agents (in order) | Parallel? |
|----------|------|--------------------|-----------|
| `code-gen` | Code Generation | language-specialist → output-validator → self-corrector → pre-commit-checker | Sequential |
| `code-mod` | Code Modification | change-impact-analyzer → language-specialist → output-validator → self-corrector → pre-commit-checker | Sequential |
| `review` | Code Review | code-reviewer, security-auditor, performance-engineer | All parallel |
| `deploy` | Pre-Deployment | quality-gate, security-auditor, change-impact-analyzer | All parallel |
| `debug` | Debug & Fix | debugger → language-specialist → output-validator → self-corrector → test-automator | Sequential |

## Language Specialist Mapping

Detect from file extensions, package managers, or project manifests:

| Signal | Agent |
|--------|-------|
| `.ts`, `.tsx`, `tsconfig.json`, `package.json` with typescript | `typescript-pro` |
| `.js`, `.jsx`, `package.json` without typescript | `javascript-pro` |
| `.py`, `pyproject.toml`, `requirements.txt`, `setup.py` | `python-pro` |
| `.rs`, `Cargo.toml` | `rust-engineer` |
| `.go`, `go.mod` | `golang-pro` |
| `.cpp`, `.cc`, `.h`, `CMakeLists.txt` | `cpp-pro` |
| `.cs`, `.csproj`, `.sln` | `csharp-developer` |
| `.java`, `pom.xml`, `build.gradle` | `java-architect` |
| `.php`, `composer.json` | `php-pro` |
| `.swift`, `Package.swift` | `swift-expert` |
| `.kt`, `build.gradle.kts` | `kotlin-specialist` |
| `.ps1`, `.psm1` | `powershell-7-expert` |
| `.sql` | `sql-pro` |
| `.ex`, `.exs`, `mix.exs` | `elixir-expert` |

## Chain Step Data Flow

Each step passes its output to the next step. The data contract:

### code-gen / code-mod
- **language-specialist** outputs: generated/modified code files
- **output-validator** outputs: validation report (pass/fail + errors)
- **self-corrector** outputs: corrected code (only runs if validator reports fail)
- **pre-commit-checker** outputs: final go/no-go for commit

### review
- **code-reviewer** outputs: code quality findings with severity
- **security-auditor** outputs: security findings with severity
- **performance-engineer** outputs: performance findings with severity
- **Merge**: combine all findings, deduplicate, sort by severity

### deploy
- **quality-gate** outputs: quality metrics report
- **security-auditor** outputs: security scan report
- **change-impact-analyzer** outputs: blast radius report
- **Merge**: produce deployment readiness matrix

### debug
- **debugger** outputs: root cause analysis + suggested fix location
- **language-specialist** outputs: implemented fix
- **output-validator** outputs: validation of fix
- **self-corrector** outputs: corrected fix (only if validation fails)
- **test-automator** outputs: new/updated test cases
