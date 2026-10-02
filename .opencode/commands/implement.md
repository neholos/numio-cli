---
description: Implement an existing brief in a new worktree (requires brief to exist).
agent: orchestrator
---
Implement an existing brief. Use when brief is already written and approved.

## Input
- Brief file path (e.g., "docs/briefs/2026-10-02-swift6-migration.md")
- Or slug (e.g., "swift6-migration")

## Process
1. **Validate brief exists** and has DRI, allowed paths, acceptance criteria
2. **Create worktree**: `scripts/new-task.sh <slug> implementer`
3. **Dispatch implementer** in worktree: "Do the task in <brief-path>"
4. **Wait for implementer report** (code changes, tests, docs impact)
5. **Dispatch verifier** in worktree: "Verify against <brief-path> and docs/specs/time-grammar.md"
6. **Report PASS/FAIL** to human

## Usage
```
/implement docs/briefs/2026-10-02-swift6-migration.md
/implement swift6-migration
```