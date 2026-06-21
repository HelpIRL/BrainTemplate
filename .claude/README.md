# .claude Directory Structure

This directory contains Claude Code configuration, commands, skills, and hooks.

## Contents

| Folder | Purpose |
|--------|---------|
| `commands/` | Human-invoked actions (`/command-name`) |
| `skills/` | Behavioral patterns Claude applies contextually |
| `hooks/` | Scripts that run at specific workflow points |

---

## Commands vs Skills

**Commands** are explicit, human-invoked actions:
- Triggered by typing `/command-name`
- Deterministic and predictable
- Easy to audit in chat logs

**Skills** are implicit behavioral patterns:
- Claude applies them when contextually relevant
- Define *how Claude thinks*, not *what Claude does*
- Should never create files, run tools, or change structure

**Rule of thumb:** If it has side effects, it's a command. If it's a thinking pattern, it's a skill.

---

## Hybrid Approach (Recommended)

You don't need to choose between embedding guidance in `CLAUDE.md` and using separate skill files. Use both:

### CLAUDE.md — Universal Absolutes

Keep rules that apply to **every project** in `CLAUDE.md`:
- Security constraints (never read `.env`)
- Scope discipline (ask before expanding)
- Intent hygiene (one intent = one objective)

These are non-negotiable defaults.

### skills/ — Project-Specific Patterns

Add skills as separate files when:
- The pattern is **project-specific** (e.g., "always use our logging format")
- You want to **swap patterns** between projects
- The guidance is **detailed enough** to warrant its own file

This keeps your core `CLAUDE.md` clean while allowing customization.

---

## Folder Details

### commands/

Human-controlled actions invoked with `/command-name`.

| Command | Description |
|---------|-------------|
| `/brain` | BRAIN method for project skeleton and intent planning |
| `/commit` | Smart commit with conventional format |
| `/review` | Code review current changes |
| `/status` | Project status overview |
| `/recap` | Summarize recent work |
| `/test` | Run project tests |
| `/template-update` | Update template from upstream |

See individual files for detailed usage.

### skills/

Behavioral patterns Claude applies automatically when relevant.

| Skill | When it applies |
|-------|-----------------|
| `systematic-debugging` | Any bug, test failure, or unexpected behavior |

Skills are **read-only guidance** — they influence how Claude approaches problems but don't execute actions.

### hooks/

Scripts that execute at specific points in Claude Code's workflow.

| Hook | Purpose |
|------|---------|
| `pre-edit.sh` | Block edits on protected branches |
| `post-edit-reminder.sh` | Remind about uncommitted changes |
| `pre-commit-test.sh` | Run tests before commits |

See `hooks/README.md` for configuration details.

---

## Resources

### Official Documentation
- [Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code)
- [Claude Code Skills](https://code.claude.com/docs/en/skills)
- [Claude Code Hooks](https://code.claude.com/docs/en/hooks)

### Skills Libraries
- [Anthropic Official Skills](https://github.com/anthropics/skills) — Official skill repository from Anthropic
- [obra/superpowers](https://github.com/obra/superpowers) — Comprehensive skills framework by Jesse Vincent (MIT License)
- [awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills) — Curated community collection

### Community Examples
- [ChrisWiles/claude-code-showcase](https://github.com/ChrisWiles/claude-code-showcase) — Hooks and configuration examples

---

## Adding Your Own

### New Command

1. Create `.claude/commands/my-command.md`
2. Add YAML frontmatter with `name` and `description`
3. Write instructions Claude follows when invoked
4. Invoke with `/my-command`

### New Skill

1. Create `.claude/skills/my-skill.md`
2. Add YAML frontmatter describing when to apply
3. Write behavioral guidance (not actions)
4. Claude loads it automatically when relevant

### New Hook

1. Create script in `.claude/hooks/`
2. Make executable: `chmod +x script.sh`
3. Configure in `.claude/settings.json`
4. See `hooks/README.md` for details
