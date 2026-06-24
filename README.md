# Claude Project Template

A starter template for AI-assisted development with strong guardrails,
repeatability, and auditability.

**This is a template repository.** Use it to scaffold new projects that work
safely and predictably with Claude Code and similar AI tools.

For attribution and license info, see [ClaudeTemplate.md](ClaudeTemplate.md).

---

## Table of Contents

- [Quick Start](#quick-start)
- [What You Get](#what-you-get)
- [After Setup](#after-setup)
- [Updating the Template](#updating-the-template)
- [Contributing](#contributing)
- [Files in This Template](#files-in-this-template)

---

## Quick Start

### Option 1: Use as GitHub Template

1. Click **Use this template** → **Create a new repository**
2. Clone your new repository
3. Open with Claude Code and follow the setup prompts

### Option 2: Add to Existing Project

```bash
mkdir -p .claude/commands
curl -sL https://raw.githubusercontent.com/HelpIRL/ClaudeTemplateV1/main/.claude/commands/template-update.md \
  -o .claude/commands/template-update.md
```

Then run `/template-update` in Claude Code and choose what to install.

---

## What You Get

| Component | Purpose |
|-----------|---------|
| `CLAUDE.md` | AI behavior rules and guardrails |
| `CONTEXT.md` | Project structure (configured during setup) |
| `.claude/commands/` | Slash commands (`/brain`, `/commit`, `/review`) |
| `.claude/skills/` | Behavioral patterns applied automatically |
| `.claude/hooks/` | Workflow scripts (pre-commit, post-edit) |
| `Intents/` | Structured intent breakdown system |

---

## After Setup

Once configured, your project will have:

- **CONTEXT.md** — Your project structure and constraints
- **README.md** — Your project documentation (replaces this file)
- **ClaudeTemplate.md** — Template attribution (keep this)

### Key Commands

| Command | Purpose |
|---------|---------|
| `/brain "Feature"` | Scaffold a new feature with intent breakdown |
| `/commit` | Smart commit with conventional format |
| `/review` | Code review current changes |
| `/status` | Project status overview |
| `/recap` | Re-establish context after a break |

---

## Updating the Template

To pull improvements from the template without affecting your project config:

```
/template-update
```

This updates commands, skills, and hooks while preserving your `CONTEXT.md`,
`README.md`, and settings.

---

## For Non-Claude Code Users

This template is built for **Claude Code** (the CLI/IDE extension). If you use a different AI coding tool, the BRAIN method and intent workflow still apply — the setup is just different.

### GitHub Copilot (VS Code)

A parallel template exists for GitHub Copilot:
[HelpIRL/CopilotTemplateV1](https://github.com/HelpIRL/CopilotTemplateV1)

It uses the same BRAIN method and `Intents/` structure but wires everything through `.github/prompts/` and `.github/copilot-instructions.md` — the files Copilot reads natively.

### Other AI Tools (Cursor, Windsurf, Gemini, etc.)

Most AI coding assistants read a project context file automatically. To add BRAIN + Init to any tool:

**Step 1 — Add a behavior contract**

Create a file your tool reads automatically (e.g. `.cursorrules`, `GEMINI.md`, or whatever your tool supports) and paste in the contents of [AGENTS.md](AGENTS.md). Adjust the file references to match your tool's conventions.

**Step 2 — Add the BRAIN workflow**

Copy the BRAIN method into your tool's prompt/command system:
- The full workflow is in [.claude/skills/brain.md](.claude/skills/brain.md)
- The trigger guidance (when to use it) is in [.claude/skills/brain-method.md](.claude/skills/brain-method.md)

Most tools support custom prompts, slash commands, or reusable instructions — drop the skill content there.

**Step 3 — Create the Intents folder**

```bash
mkdir -p Intents/
```

The `Intents/` structure is tool-agnostic. No changes needed.

**Step 4 — Bootstrap your project**

Ask your AI assistant to read your behavior contract and walk you through the BRAIN method Begin + Refine phases to create `Intents/<YourProject>/CONTEXT.md`.

---

## Contributing

Contributions welcome! This template is maintained by **HelpIRL LLC**.

- Issues: [GitHub Issues](https://github.com/HelpIRL/ClaudeTemplateV1/issues)
- Email: john@helpirl.com

Before contributing:
1. Fork the repository
2. Create a feature branch
3. Test changes with a fresh project
4. Submit a pull request

See [ClaudeTemplate.md](ClaudeTemplate.md) for license and attribution.

---

## Files in This Template

```
├── CLAUDE.md              # AI behavior contract
├── ClaudeTemplate.md      # Attribution and bootstrap logic
├── CONTEXT.md             # Project context (placeholder until configured)
├── README.md              # This file (replaced during setup)
├── LICENSE                # MIT License
├── .claude/
│   ├── commands/          # Slash commands
│   ├── skills/            # Behavioral patterns
│   ├── hooks/             # Workflow scripts
│   └── settings.json      # Permissions and config
├── .github/               # Issue templates, PR templates
└── Intents/               # Intent breakdown structure
```
