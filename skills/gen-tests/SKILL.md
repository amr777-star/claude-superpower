---
name: gen-tests
description: Generate comprehensive test suites for existing untested code by detecting the test framework, scanning conventions, and orchestrating test-automator and test-quality-auditor agents.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
---
# Generate Tests
Detect conventions, generate tests, audit quality.
## Context
**Test framework**: !`grep -l jest package.json 2>/dev/null || grep -l vitest package.json 2>/dev/null || [ -f pytest.ini ] && echo pytest || echo detect`
**Existing tests**: !`find . -name "*.test.*" -o -name "*.spec.*" -o -name "test_*.py" 2>/dev/null | head -5 || echo none`
## Usage
/gen-tests $ARGUMENTS
## Workflow
1. Launch convention-scanner to detect test patterns and framework
2. Launch test-automator with convention profile and target files
3. Launch test-quality-auditor to verify tests are meaningful
4. Regenerate any weak tests, present final files
