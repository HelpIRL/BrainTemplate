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
