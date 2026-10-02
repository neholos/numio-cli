#!/usr/bin/env bash
# Create an isolated task: git worktree + branch + brief, and print how to start the feature-team agent.
# Usage: scripts/new-task.sh <slug> <agent> [brief-file]
#   slug        short kebab-case name, e.g. seconds-parsing
#   agent       implementer | team-core | team-cli | ...
#   brief-file  optional path to an existing brief (e.g. written by the orchestrator); otherwise the template is used
# Env: BASE=<branch to start from> (default: current branch)
set -euo pipefail

slug="${1:?usage: new-task.sh <slug> <agent> [brief-file]}"
agent="${2:?usage: new-task.sh <slug> <agent> [brief-file]}"
brief_src="${3:-}"

root="$(git rev-parse --show-toplevel)"
base="${BASE:-$(git -C "$root" rev-parse --abbrev-ref HEAD)}"
wt="$(dirname "$root")/numio-$slug"
branch="agent/$slug"
brief_rel="docs/briefs/$(date +%F)-$slug.md"

if [ -e "$wt" ]; then echo "error: $wt already exists" >&2; exit 1; fi
git -C "$root" worktree add "$wt" -b "$branch" "$base"

mkdir -p "$wt/docs/briefs"
if [ -n "$brief_src" ]; then
  cp "$brief_src" "$wt/$brief_rel"
else
  { echo "# Task brief: $slug"; tail -n +2 "$root/docs/briefs/_template.md"; } > "$wt/$brief_rel"
fi

cat <<MSG

Worktree: $wt
Branch:   $branch  (from $base)
Brief:    $brief_rel  (fill in DRI, allowed paths and acceptance examples before starting)

Interactive:
  cd "$wt" && opencode --agent $agent
  then: "Do the task in $brief_rel"

Headless (non-interactive):
  opencode run --agent $agent --dir "$wt" "Do the task in $brief_rel"

When done (from the main checkout):
  git -C "$wt" diff --name-only $base      # scope check
  cd "$root" && git worktree remove "$wt"  # after the branch is merged
MSG