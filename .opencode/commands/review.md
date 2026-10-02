---
description: Tier-aware review of the current changes against a base branch (default main).
agent: orchestrator
---
Base branch: $ARGUMENTS (use `main` if empty). Can also be a worktree path.

## Process
1. **Determine base**: if argument is a path, use `main` and cd to that path
2. **Run tier check**: `python3 scripts/review-tier.py <base>` → show tier and warnings
3. **Dispatch reviewer**:
   - T0: @docs-reviewer
   - T1: @verifier
   - T2/T3: @verifier + explicit human review required
4. **Summarize** (max 10 lines): verdict, top findings with file:line, what human must check

## Usage
```
/review
/review main
/review ../numio-swift6-migration
```