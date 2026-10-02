---
description: Run independent verification of current worktree against brief and spec.
agent: verifier
---
Independent verification. Run from inside the worktree.

## Input
- Brief file path (relative to worktree or main repo)
- Optional: base branch (default: main)

## Process
1. **Determine tier**: `python3 scripts/review-tier.py <base>`
2. **Scope check**: `git diff --name-only <base>` matches brief allowed paths
3. **Build & test**: `swift build && swift test`
4. **Spec match**: Check examples in `docs/specs/time-grammar.md` touched by change have tests
5. **Architecture**: No I/O in NumioCore, CLI stays thin wrapper
6. **Edge cases**: Midnight wrap, negative, 24:00, invalid, empty
7. **Docs**: Spec, CHANGELOG, ADR updated if required

## Output
```
Verdict: PASS|FAIL
Findings:
- file:line - description
Could not verify:
- ...
```

## Usage (from worktree)
```
/verify ../docs/briefs/2026-10-02-swift6-migration.md
/verify
```