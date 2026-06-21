#!/bin/bash
# Pre-commit hook: Run tests before allowing commit
#
# This hook runs before git commit and blocks if tests fail.
# Requires CONTEXT.md to define a test command.
#
# To enable, add to .claude/settings.json:
#
#   "hooks": {
#     "PreToolUse": [
#       {
#         "matcher": "Bash(git commit*)",
#         "hooks": [
#           {
#             "type": "command",
#             "command": ".claude/hooks/pre-commit-test.sh",
#             "timeout": 120
#           }
#         ]
#       }
#     ]
#   }

# Look for test command in CONTEXT.md
TEST_CMD=""

if [ -f "CONTEXT.md" ]; then
  # Try to extract test command (looks for "Test: `command`" pattern)
  TEST_CMD=$(grep -oP 'Test:\s*`\K[^`]+' CONTEXT.md 2>/dev/null | head -1)
fi

# If no test command found, give helpful feedback
if [ -z "$TEST_CMD" ] || [ "$TEST_CMD" = "none yet" ]; then
  echo '{"feedback": "No test command defined in CONTEXT.md. Ask me how to add tests."}'
  exit 0
fi

# Run tests
echo "Running tests: $TEST_CMD" >&2
eval "$TEST_CMD" >&2
TEST_EXIT=$?

if [ $TEST_EXIT -ne 0 ]; then
  echo '{"block": true, "message": "Tests failed. Fix failing tests before committing."}' >&2
  exit 2
fi

exit 0
