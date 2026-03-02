# Claude Desktop Setup Guide

## How Claude Desktop Works with Your Superpower Setup

Claude Desktop app on Windows reads its config from:
```
%APPDATA%\Claude\claude_desktop_config.json
```

### Option 1: Use Claude Code from Desktop (Recommended)

The simplest approach — Claude Desktop can launch Claude Code which already has all your agents, skills, and commands installed at `~/.claude/`.

1. Open Claude Desktop
2. Use the terminal/code feature to invoke Claude Code
3. All 146 agents, 8 orchestrator skills, and 15 slash commands are automatically available

### Option 2: Add Custom System Prompt to Desktop

You can configure Claude Desktop with a system prompt that includes your routing intelligence:

1. Open Claude Desktop settings
2. Find "Custom Instructions" or "System Prompt"
3. Paste the contents of `claude-web-instructions.md` from this repo

### Option 3: MCP Servers for Desktop

If you use MCP servers with Claude Desktop, your existing `claude_desktop_config.json` already has:
- Figma MCP (get_metadata, get_variable_defs, get_screenshot)

To add more MCP servers, edit:
```json
// %APPDATA%\Claude\claude_desktop_config.json
{
  "mcpServers": {
    "your-server": {
      "command": "path/to/server",
      "args": ["--arg1"]
    }
  }
}
```

## Environment Coverage Matrix

| Environment | How It Gets Superpower | Auto-Trigger? |
|-------------|----------------------|---------------|
| **Claude Code CLI** | `~/.claude/` directory (automatic) | Yes — CLAUDE.md routes all tasks |
| **Claude Code + VS Code** | Same `~/.claude/` directory | Yes — same routing |
| **Claude Code + JetBrains** | Same `~/.claude/` directory | Yes — same routing |
| **claude.ai (web)** | Project Custom Instructions | Yes — paste `claude-web-instructions.md` |
| **Claude Desktop** | System prompt or Claude Code integration | Depends on setup |
| **Claude API** | Include routing prompt in system message | Yes — programmatic |

## For API/SDK Usage

If you're building apps with the Claude API, include the contents of `claude-web-instructions.md` in your system prompt to get the same specialist routing:

```python
import anthropic

client = anthropic.Anthropic()

with open("config/claude-web-instructions.md") as f:
    system_prompt = f.read()

response = client.messages.create(
    model="claude-sonnet-4-6-20250514",
    max_tokens=4096,
    system=system_prompt,
    messages=[{"role": "user", "content": "Review this Python code..."}]
)
```

## Quick Verification

After installing, verify each environment:

| Environment | Verification |
|-------------|-------------|
| Claude Code CLI | Run `claude` → type `/workflow-runner` → should autocomplete |
| VS Code | Open Claude Code sidebar → type `/deep-review` → should autocomplete |
| claude.ai web | Create test project → ask "review this code" → should auto-apply 3-dimension review |
| Claude Desktop | Open app → ask a coding question → should apply specialist knowledge |
