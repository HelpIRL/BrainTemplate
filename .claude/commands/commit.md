# Smart Commit

Generate a commit message for staged changes following conventional commits format.

## Instructions

1. Run `git diff --staged` to analyze changes
2. Determine the commit type:
   - `feat:` - New feature
   - `fix:` - Bug fix
   - `docs:` - Documentation only
   - `style:` - Formatting, no code change
   - `refactor:` - Code change that neither fixes nor adds
   - `test:` - Adding or updating tests
   - `chore:` - Build process, dependencies, tooling
3. Write a concise subject line (≤50 chars)
4. Add body if changes are non-trivial (wrap at 72 chars)
5. Reference issues if mentioned in $ARGUMENTS

## Output

Show the proposed commit message, then ask for confirmation before running:

```bash
git commit -m "type: subject" -m "body"
```

$ARGUMENTS
