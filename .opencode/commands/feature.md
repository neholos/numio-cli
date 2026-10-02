---
description: Run full feature workflow: brief → worktree → implement → verify → deliver.
agent: orchestrator
---
Full feature workflow with enforcement gates.

## Input
- Issue number or slug (e.g., "8" or "swift6-migration")
- Optional: initiative ID (default: from docs/initiatives.md)

## Process
1. **Brief creation** (orchestrator):
   - Read issue details (gh issue view)
   - Read docs/initiatives.md for initiative mapping
   - Write brief to docs/briefs/<yyyy-mm-dd>-<slug>.md using template
   - Present brief to human for approval (DRI, allowed paths, acceptance)

2. **Worktree creation** (orchestrator via script):
   - `scripts/new-task.sh <slug> implementer`
   - Brief is copied to worktree

3. **Implementation** (orchestrator dispatches):
   - Start `opencode --agent implementer` in worktree
   - Prompt: "Do the task in docs/briefs/<brief-file>.md"
   - Implementer reads brief, writes code, runs tests, commits

4. **Verification** (orchestrator dispatches):
   - Start `opencode --agent verifier` in worktree
   - Prompt: "Verify against docs/briefs/<brief-file>.md and docs/specs/time-grammar.md"
   - Verifier runs review-tier.py, build, test, scope check, spec match
   - Returns PASS/FAIL with findings

5. **Delivery** (human):
   - If PASS: human merges from main repo
   - `git worktree remove <worktree>`
   - Update docs/initiatives.md (status, DRI)

## Gates
- Brief must be approved by human before step 3
- Verifier must PASS before step 5
- T2/T3 changes require explicit human approval at step 5

## Usage
```
/feature 8
/feature swift6-migration
/feature 8 I-004
```