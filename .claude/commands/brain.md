# Claude Command: BRAIN Method — Project Skeleton & Intent List

# Copyright (c) 2025 John Hewitt (john@helpirl.com)
# Licensed under the MIT License. See LICENSE file for details.

> **Purpose:** Create a minimal, consistent folder + file scaffold for an idea using the **BRAIN** method, then convert it into an actionable, time-boxed intent list.

## Invocation

```
/brain "Your Idea Title"
/brain "Your Idea Title" --base Intents/
```

---

## BRAIN Phases

| Phase | Owner | Time | Claude's Role |
|-------|-------|------|---------------|
| **B**egin | 100% Human | ≤3 min | Acknowledge receipt only. No analysis, suggestions, or reframing. |
| **R**efine | 90% Human | ≤15 min | Ask targeted clarifying questions only. |
| **A**rrange | 90% AI | — | Propose intent breakdown. All output provisional until human approval. |
| **I**terate | 90% AI | — | Execute intents one at a time. Log outcomes and blockers. |
| **N**ext | 100% Human | — | Decide next action: continue, pause, switch projects, or add to backlog. |

> **Critical:** During Begin, Claude must not analyze, summarize, suggest, or reframe.
> Violation = stop and restart the phase.

---

## Defaults & Derivations

| Setting | Default | Notes |
|---------|---------|-------|
| **Base path** | `Intents/` | Root folder for all projects |
| **Intent duration** | ≤2 hours | Maximum time per intent |
| **IdeaFolder** | PascalCase(IdeaTitle) | Stop-words removed |
| **ShortName** | 2–4 words, PascalCase | 3–24 chars, no punctuation |

**Example:**
- Idea: "Add user authentication"
- Folder: `Intents/UserAuthentication/`
- Intent files: `01-ResearchAuthOptions.md`, `02-ImplementLogin.md`

---

## Output Structure

```
Intents/
  {IdeaFolder}/
    CONTEXT.md        # Begin + Refine
    Status.md         # Progress tracking
    01.IntentName.md  # Intent files (after Arrange approval)
```

---

## File Templates

### 1. CONTEXT.md

```md
# {IdeaTitle}

> Owner: {Name}  ·  Created: {YYYY-MM-DD}

## Begin (raw)
<!-- 3-minute brain dump. Do not edit or reinterpret. -->

## Refine (scope)
- **Goal**:
- **In / Out of scope**:
- **Definition of Done**:
- **Constraints**: (optional)
- **Risks**: (optional)
- **Resources**: (optional)
- **Dependencies**: (optional)
```

### 2. Status.md

```md
# Status — {IdeaTitle}

## Intents
| No. | Name | Status | Est. | Actual | Notes |
|----:|------|--------|-----:|-------:|-------|
| 1   | …    | Todo   | 2h   |        |       |

> Claude may update **Status** column. Human owns **Actual** column.

## Project State
- **Status**: Active | Paused | Abandoned
- **Reason**: (if paused/abandoned)
- **Revisit trigger**: (if paused)
```

### 3. Intent Files (`N.ShortName.md`)

Created **only after Arrange approval**.

```md
# {N}. {ShortName}

**Goal**:
**Est.**: ≤2 hours
**Dependencies**:

## Steps
- [ ] …

## Definition of Done
- [ ] …

## Outcome (fill after Iterate)
- **Actual Time**:
- **Result**:
- **Follow-ups**:
```

---

## Safety Rules

- **Never overwrite** existing files. Append and continue numbering.
- **Never delete or rename** files without explicit approval.
- **Never renumber** existing intents.
- **Never infer approval** — wait for explicit yes.
- Prefer **small, incremental changes**.
- If in a git repo, commit at each phase:
  - `chore(brain): scaffold {IdeaFolder}`
  - `feat(arrange): propose intents 1–5`

---

## Execution Order

1. **Confirm**: Echo `IdeaTitle`, `BasePath`, derived `IdeaFolder`.
2. **Create folders**: Ensure `{BasePath}/{IdeaFolder}/` exists.
3. **Create or append CONTEXT.md**:
   - If missing: create from template
   - If present: prepend new Begin/Refine sections with date tag
4. **Refine interview**:
   - Ask **3–5 questions max per turn**
   - Map each question to a missing Refine field
   - Allow `TBD` answers
5. **Propose Arrange list**:
   - 5–10 intents, ≤2 hours each
   - Include brief DoD + dependencies
   - **Do not create files yet**
6. **Wait for approval** (explicit yes or edits)
7. **Create intent files**: Continue numbering from highest existing N
8. **Create/update Status.md**
9. **Report**: Summary of changes + suggested Next action

---

> **Usage notes:** `/brain "My Great Feature"` — then follow the execution order above.
