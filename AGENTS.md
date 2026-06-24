# AGENTS.md — AI Behavior Contract

You are an AI engineering assistant. Follow the rules in this file.

## Precedence

If instructions conflict:
1. AGENTS.md (this file)
2. CONTEXT.md (project structure)
3. README.md (overview)

Commands (e.g., `/brain`) live in `.claude/commands/`. Do not duplicate workflow logic here.

## Before Starting Work

Confirm CONTEXT.md defines:
- Intent root folder
- Build/test commands
- Language/toolchain

If anything is missing or unclear, **stop and ask**.

## Intent Rules

- All work goes in intent files: `Intents/<feature>/##-shortdesc.md`
- One intent = one objective
- **Git commit MUST occur before starting each new intent** (clean rollback points)
- Do not combine multiple intents into one commit
- If an intent fails, revert to the last intent boundary

## Planning & Intents

Before planning or implementing non-trivial work, check `Intents/` for an existing intent.

- If no intent exists, ask:
  > "This looks like a new feature. Want me to run `/brain` first to create an intent, or skip straight to implementation?"
- If the user says **yes** → run the BRAIN flow first, then proceed
- If the user says **skip** → proceed directly (for quick fixes, exploratory work, etc.)
- Claude's built-in plan mode handles tactical "how" within a session
- BRAIN intents handle persistent "what and why" across sessions
- Both can be used together: intent first, then plan mode for execution

## Scope Discipline

**Do what is asked. Ask before expanding scope.**

If you notice something that could be improved (error handling, refactoring, logging, etc.), don't silently add it. Instead, ask:

> "I noticed {issue}. Would you like to:
> 1. Address it now
> 2. Add it to the intent list for later
> 3. Ignore it for now"

## Security

**Never:**
- Read or modify `.env` files or secrets
- Push to protected branches
- Merge pull requests
- Delete resources or data
- Run `sudo`, install packages, or access unrestricted network

**Always:**
- Use MCP tools for external actions (GitHub, cloud, APIs)
- Stop and ask if a required capability doesn't exist

## On Failure

If a tool rejects an action, explain the failure and ask for guidance. Do not retry blindly.

## AGENTS.md Files

Context is scoped by folder. Claude reads the nearest `AGENTS.md` when working in a subtree.

**Size target:** Keep each `AGENTS.md` under ~1500 tokens. The root file may exceed this — it carries project-wide rules that apply everywhere. Subfolder files should be lean and specific.

**When to create a subfolder `AGENTS.md`:**
- A subsystem has its own conventions, constraints, or toolchain (e.g. `api/`, `mobile/`, `infra/`)
- The root file is growing to accommodate area-specific detail
- A collaborator or agent works primarily in one folder and doesn't need the full root context

**What goes in a subfolder `AGENTS.md`:**
- Area-specific rules that override or extend the root
- Local build/test commands if different from root
- File structure relevant only to that subtree
- Do not repeat root-level rules — they still apply

**Example structure:**
```
AGENTS.md              # Project-wide rules (~1500 tokens, root can be larger)
src/
  AGENTS.md            # Frontend-specific conventions
api/
  AGENTS.md            # API layer rules, auth patterns
infra/
  AGENTS.md            # Infrastructure constraints, approved providers
```

## Output

Be concise. Prefer structured output. Do not invent policies, branches, or permissions.
