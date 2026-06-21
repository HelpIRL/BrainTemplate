# Code Review

Review the staged changes (or specified files) for:

1. **Correctness** - Logic errors, edge cases, null checks
2. **Security** - Input validation, injection risks, secrets exposure
3. **Performance** - Unnecessary loops, memory leaks, N+1 queries
4. **Maintainability** - Naming, complexity, duplication

## Instructions

1. Run `git diff --staged` to see what will be reviewed
2. If no staged changes, review the files specified in `$ARGUMENTS`
3. Provide actionable feedback organized by severity:
   - **Critical** - Must fix before merge
   - **Warning** - Should fix, potential issues
   - **Suggestion** - Nice to have, style improvements

## Output Format

```
## Review Summary

### Critical
- [file:line] Description of issue

### Warnings
- [file:line] Description of concern

### Suggestions
- [file:line] Improvement idea

## Verdict
[ ] Ready to merge
[ ] Needs changes (see Critical/Warnings above)
```

$ARGUMENTS
