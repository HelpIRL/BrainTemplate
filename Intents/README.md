# Intents

This folder contains structured intent breakdowns for project work.

## Structure

```
Intents/
  {FeatureName}/
    CONTEXT.md        # Goal, scope, and requirements
    Status.md         # Progress tracking
    01.IntentName.md  # Individual intent files
    02.IntentName.md
    ...
```

## Conventions

- **One folder per feature or initiative**
- **Intents are numbered** (`01.`, `02.`, etc.) and executed in order
- **Each intent has a clear Definition of Done**
- **Git commits occur at intent boundaries**

## Creating Intents

Use the `/brain` command to scaffold a new feature:

```
/brain "My Feature Name"
```

This creates the folder structure and guides you through the BRAIN workflow.

## Intent States

| Status | Meaning |
|--------|---------|
| Todo | Not started |
| In Progress | Currently being worked on |
| Blocked | Waiting on something external |
| Done | Completed and committed |

See [CLAUDE.md](../CLAUDE.md) for intent execution rules.
