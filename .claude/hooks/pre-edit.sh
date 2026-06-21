#!/bin/bash
# Pre-edit hook: Block edits on protected branches
#
# Provenance: Adapted from ChrisWiles/claude-code-showcase
# https://github.com/ChrisWiles/claude-code-showcase
#
# To enable, add to .claude/settings.json:
# {
#   "hooks": {
#     "PreToolUse": [{
#       "matcher": "Edit|MultiEdit|Write",
#       "hooks": [{"type": "command", "command": ".claude/hooks/pre-edit.sh", "timeout": 5}]
#     }]
#   }
# }

branch=$(git branch --show-current 2>/dev/null)

if [[ "$branch" == "main" || "$branch" == "master" ]]; then
  echo '{"block": true, "message": "Cannot edit files on protected branch. Create a feature branch first."}' >&2
  exit 2
fi

exit 0
