#!/bin/bash
# Post-edit hook: Remind about uncommitted changes
#
# This hook runs after Edit/Write operations and reminds the user
# if there are uncommitted changes piling up.
#
# To enable, add to .claude/settings.json:
#
#   "hooks": {
#     "PostToolUse": [
#       {
#         "matcher": "Edit|Write",
#         "hooks": [
#           {
#             "type": "command",
#             "command": ".claude/hooks/post-edit-reminder.sh"
#           }
#         ]
#       }
#     ]
#   }

# Count uncommitted changes
changed_files=$(git status --porcelain 2>/dev/null | wc -l)

# Only remind if there are several uncommitted files
# Adjust threshold as needed (default: 5)
THRESHOLD=5

if [ "$changed_files" -ge "$THRESHOLD" ]; then
  echo "{\"feedback\": \"📝 You have $changed_files uncommitted files. Consider committing at an intent boundary.\"}"
fi
