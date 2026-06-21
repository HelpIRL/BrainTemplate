# Project Status

Show a quick overview of the current project state.

## Instructions

Run these commands and summarize:

1. `git status` - Working tree state
2. `git log --oneline -5` - Recent commits
3. Check `Intents/` for in-progress work
4. Check for uncommitted changes

## Output Format

```
## Git Status
Branch: {branch}
Clean: {yes/no}
Ahead/Behind: {if tracking remote}

## Recent Commits
- {hash} {message}
- ...

## Active Intents
- {intent folder}: {current intent status}

## Pending Changes
- {modified files summary}
```

$ARGUMENTS
