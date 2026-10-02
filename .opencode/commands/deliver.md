---
description: Finalize worktree: verify, then merge to main (human approval required).
agent: orchestrator
---
Delivery gate. Run from main repo (not worktree).

## Input
- Worktree path or slug (e.g., "../numio-swift6-migration" or "swift6-migration")

## Process
1. **Run verify** in worktree (dispatch verifier)
2. **Check tier**: T2/T3 → require explicit human approval
3. **Present summary**: diff stat, test results, verifier verdict
4. **Human approval**: "Merge?" (yes/no)
5. **If yes**: merge branch, update docs/initiatives.md, remove worktree

## Gates
- Verifier must PASS
- T2/T3: explicit human "yes"
- Scope matches brief

## Usage
```
/deliver ../numio-swift6-migration
/deliver swift6-migration
```