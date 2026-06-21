# Init — Project Bootstrap & Orientation
Run once to set up a new project. Offers to self-remove after first intents are created.

## Temporarily Overrides Claudes Built in init in favor of a question and answer tool that will walk individuals through the agentic process.

## Instructions

**Step 1: Read these files for full context:**

1. `CLAUDE.md`
2. `CONTEXT.md`
3. `ClaudeTemplate.md`
4. `.claude/README.md`

**Step 2: Check bootstrap status**

Read `CONTEXT.md`. If it contains the line `# If this line exists, the project is in bootstrap mode.`, this project has not been configured yet. Follow the **Bootstrap Flow** below.

If `CONTEXT.md` does NOT contain the bootstrap flag, the project is already configured. Skip to **Orientation** below.

---

## Bootstrap Flow

Follow the bootstrap instructions from `ClaudeTemplate.md`:

### 1. Welcome Message

Display:

> **Welcome to the HelpIRL Claude Template**
>
> This repository is pre-wired with a practical, opinionated structure for working
> with Claude in a way that stays readable, repeatable, and team-friendly.
>
> This template uses the **BRAIN method** to establish shared context before any
> code is written.
>
> **Begin (B):** Idea capture only — no design, no planning, no solutions yet.
>
> Once that's done, I'll guide you through:
> - **Refine (R):** clarifying goals and constraints
> - **Arrange (A):** identifying developer intents and structure
>
> ---
>
> **What is this project? Give me the elevator pitch in 2-3 sentences.**

### 2. Auto-Detect Values

- OWNER/REPO from `git remote get-url origin`
- Existing folder structure

### 3. Begin Phase

- Wait for user to describe their project
- Acknowledge receipt only — no analysis, suggestions, or reframing
- Commit: `chore(init): begin project definition`

### 4. Refine Phase

Ask targeted questions:
- Primary language/framework?
- Build command? (or "none yet")
- Test command? (or "none yet")
- Source code location? (e.g., `src/`, `lib/`, project root)
- Any key constraints or considerations?
- Commit: `chore(init): refine project context`

### 5. Populate Files

Replace files with project-specific content using the templates in `ClaudeTemplate.md`:

- **CONTEXT.md** — Use the CONTEXT.md template, keeping the reference comment at top
- **README.md** — Use the README.md template
- **.github/ISSUE_TEMPLATE/config.yml** — Replace `OWNER/REPO` with detected values

Commit: `chore(init): populate project configuration`

### 6. Explain Intent Workflow

Tell the user:

> Your project is configured. Features are broken into intents under `Intents/`.
>
> Standard practice: commit when each intent is complete so work is captured
> and you have clean rollback points.
>
> Structure:
> ```
> Intents/
>   {FeatureName}/
>     CONTEXT.md        # Feature context (Begin + Refine)
>     Status.md         # Progress tracking
>     01-IntentName.md  # Individual intent files
> ```

### 7. Transition

- Ask if ready to scaffold their first feature
- If yes, follow `/brain` command to create the intent file structure

After intents are created, proceed to **Cleanup** below.

---

## Orientation

Display this when the project is already configured (no bootstrap flag):

---

**Welcome to the Claude Template**

You're set up. Here's the quick map.

### What Just Happened

BRAIN walked you through project setup:
- **Begin** — captured your idea
- **Refine** — clarified constraints
- **Arrange** — created intent structure

Your project is now configured in `CONTEXT.md`.

### Key Files

| File | Role |
|------|------|
| `CLAUDE.md` | AI behavior contract — rules Claude follows |
| `CONTEXT.md` | Your project structure and constraints |
| `ClaudeTemplate.md` | Bootstrap instructions and file templates |
| `.claude/commands/` | Slash commands you invoke |
| `.claude/skills/` | Behavioral patterns Claude applies automatically |
| `Intents/` | Where work gets broken down |

### Commands vs Skills

**Commands** = You invoke them (`/commit`, `/review`, `/brain`, `/status`)
**Skills** = Claude applies them when relevant (no action needed from you)

### What's Next

1. Describe what you want to build
2. Claude creates intent files under `Intents/`
3. Work through intents, commit at boundaries

### Learn More

- `.claude/README.md` — detailed docs on commands, skills, hooks
- `/status` — see current project state
- `/recap` — re-establish context after a break

---

## Cleanup

After bootstrap is complete and first intents are created, ask the user:

> "The `/init` command is meant to run once. Want me to remove it so the built-in `/init` takes over for future use?"

If yes:
1. Delete `.claude/commands/init.md`
2. Confirm: "Done. Happy building!"

If no:
1. Respond: "No problem — it'll be here if you need it. Happy building!"
