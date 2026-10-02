---
description: Tier-aware review of the current changes against a base branch (default main).
agent: orchestrator
---
Base branch: $ARGUMENTS (use `main` if empty).

1. Run `python3 scripts/review-tier.py <base>` and show the tier and warnings.
2. T0: dispatch @docs-reviewer. T1: dispatch @verifier. T2/T3: dispatch @verifier, then tell me exactly what I must read myself.
3. Summarize in at most 10 lines: verdict, top findings with file:line, what I should check by hand.