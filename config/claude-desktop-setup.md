# Claude Desktop Setup Guide

## Overview

This guide makes your Claude Superpower system operational in the Claude Desktop app. There are multiple approaches depending on how you use Desktop.

## Environment Coverage Matrix

| Environment | Setup Method | Auto-Routing? | Agents Available? |
|-------------|-------------|---------------|-------------------|
| **Claude Code CLI** | `~/.claude/` directory (automatic) | Yes | All 296 components |
| **VS Code + Claude Code** | Same `~/.claude/` (automatic) | Yes | All 296 components |
| **JetBrains + Claude Code** | Same `~/.claude/` (automatic) | Yes | All 296 components |
| **claude.ai Web** | Project custom instructions | Yes | Routing intelligence only |
| **Claude Desktop** | System prompt (see below) | Yes | Routing intelligence only |
| **Anthropic API/SDK** | System message | Yes | Routing intelligence only |

> **Note**: Claude Code CLI/VS Code/JetBrains get the full 296-component system (skills, subagents, slash commands) because they execute from `~/.claude/`. Web, Desktop, and API get the routing intelligence and guardrails — Claude applies specialist knowledge from its training rather than loading external agent files.

## Claude Desktop Configuration

### Option 1: Custom Instructions (Recommended)

1. Open **Claude Desktop** app
2. Go to **Settings** (gear icon or Ctrl+,)
3. Find **"Custom Instructions"** or **"System Prompt"**
4. Paste the contents of one of these files:
   - **Full version**: `claude-web-instructions.md` (comprehensive, ~400 lines)
   - **Compact version**: `claude-api-system-prompt.md` (token-efficient, ~120 lines)
5. Save

### Option 2: Claude Code Integration

If Claude Desktop supports running Claude Code:
1. All 296 components are automatically available via `~/.claude/`
2. No additional configuration needed
3. Skills, subagents, and slash commands all work natively

### Option 3: MCP Servers

Claude Desktop supports MCP servers via its config file:

**Config location**: `%APPDATA%\Claude\claude_desktop_config.json`

```json
{
  "mcpServers": {
    "figma": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/claude-code-mcp-figma"]
    },
    "n8n": {
      "command": "npx",
      "args": ["-y", "n8n-mcp-server"],
      "env": {
        "N8N_BASE_URL": "http://localhost:5678",
        "N8N_API_KEY": "your-api-key"
      }
    }
  }
}
```

## What Each Environment Gets

### Full System (Claude Code CLI, VS Code, JetBrains)

| Component | Count | How It Works |
|-----------|-------|-------------|
| **Orchestrator Skills** | 44 | Loaded from `~/.claude/skills/` — chain multiple agents |
| **Subagents** | 185 | Loaded from `~/.claude/agents/` — deep specialist workers |
| **Slash Commands** | 68 | Loaded from `~/.claude/commands/` — quick generators |
| **CLAUDE.md Config** | 1 | Auto-routing rules, guardrails, workflow chains |

### Routing Intelligence (Web, Desktop, API)

| Capability | Available? |
|------------|-----------|
| Auto-detect language/framework | Yes |
| Apply specialist knowledge | Yes (from Claude's training) |
| Workflow chains (gen/mod/review/debug/deploy) | Yes |
| Code generation guardrails | Yes |
| Structured output formats (reviews, impact) | Yes |
| Launch subagents | No (Claude Code only) |
| Execute slash commands | No (Claude Code only) |
| Run shell commands | No (Claude Code only) |

## Quick Setup for Each Environment

### claude.ai Web
1. Create a new **Project** on claude.ai
2. Open Project Settings -> **Custom Instructions**
3. Paste contents of `claude-web-instructions.md`
4. All conversations in that project now have superpower routing

### Anthropic API / SDK
Use `claude-api-system-prompt.md` as your system message:

**Python (Anthropic SDK)**:
```python
import anthropic

client = anthropic.Anthropic()

with open("claude-api-system-prompt.md") as f:
    system_prompt = f.read()

response = client.messages.create(
    model="claude-opus-4-6",
    max_tokens=4096,
    system=system_prompt,
    messages=[{"role": "user", "content": "Your request here"}]
)
```

**TypeScript (Anthropic SDK)**:
```typescript
import Anthropic from "@anthropic-ai/sdk";
import { readFileSync } from "fs";

const client = new Anthropic();
const systemPrompt = readFileSync("claude-api-system-prompt.md", "utf-8");

const response = await client.messages.create({
  model: "claude-opus-4-6",
  max_tokens: 4096,
  system: systemPrompt,
  messages: [{ role: "user", content: "Your request here" }],
});
```

**cURL**:
```bash
SYSTEM=$(cat claude-api-system-prompt.md)
curl https://api.anthropic.com/v1/messages \
  -H "x-api-key: $ANTHROPIC_API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -H "content-type: application/json" \
  -d "{
    \"model\": \"claude-opus-4-6\",
    \"max_tokens\": 4096,
    \"system\": $(echo "$SYSTEM" | jq -Rs .),
    \"messages\": [{\"role\": \"user\", \"content\": \"Your request\"}]
  }"
```

## Verification

After setup, test with these prompts to verify routing works:

1. **Language routing**: "Write a TypeScript function to debounce API calls" — should apply strict typing, generics, no `any`
2. **Framework routing**: "Create a Next.js API route with auth" — should use App Router, Server Actions
3. **Security guardrails**: "Write a SQL query with user input" — should use parameterized queries
4. **Review workflow**: "Review this code: [paste code]" — should analyze quality + security + performance
5. **Debug workflow**: "Fix this error: [paste error]" — should trace root cause, minimal fix, suggest tests
