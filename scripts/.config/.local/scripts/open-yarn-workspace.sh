#!/usr/bin/env bash
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

if [[ $# -eq 1 ]]; then
  selected="$1"
else
  selected="$(
    yarn workspaces list --json \
    | jq -r 'select(.location) | .location' \
    | fzf --prompt='workspaces> '
  )"
fi

[[ -z "$selected" ]] && exit 0

# launch nvim with that directory as cwd (subshell so your shell cwd stays put)
(cd "$ROOT/$selected" && exec nvim .)
