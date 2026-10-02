---
id: EVAL-0001
title: Model Bakeoff for Agents
type: eval
status: active
date: 2026-10-01
tags: [models, opencode, benchmark]
owner: TBD
---
TL;DR: 3 real tasks from your repo, same brief and starting commit, 2–3 models; choose by tests, diff scope, and scope violations, not impression.

## Candidates
- A: `opencode/nemotron-3-ultra-free`
- B: `opencode/mimo-v2.5-free`
- C (optional): `opencode/longcat-2.5-preview-free` (zero retention) or cheap paid, e.g. `opencode/deepseek-v4-flash`

## Tasks (from open issues)
- T1: seconds in parser (#2), 3 examples from `SPEC-0001`.
- T2: natural units `1h + 24min` (#11).
- T3: edge-case suite: midnight, negative, `24:00`, invalid.

## Protocol
1. Each run: new worktree from same starting commit, fresh session, agent `build` with same brief instruction. No hints or manual fixes.
2. Verifier (different model) checks against brief; human reads diff.
3. Record: tests passed first try (yes/no), steps/tool calls, diff size, files out of scope, regressions, notes.
4. Repeat T1 once more (different randomness).

## Results
| task | model | tests 1st try | steps | diff (lines) | out of scope | regressions | notes |
|------|-------|---------------|-------|--------------|--------------|-------------|-------|
| T1   | A     |               |       |              |              |             |       |
| T1   | B     |               |       |              |              |             |       |
| T2   | A     |               |       |              |              |             |       |
| T2   | B     |               |       |              |              |             |       |
| T3   | A     |               |       |              |              |             |       |
| T3   | B     |               |       |              |              |             |       |

## Decision
Model for `build`, `orchestrator`, `verifier` recorded in ADR-0002 (change `status` to accepted). If both free models fail T2/T3, fall back to paid Plan B from ADR-0002 for orchestrator and verifier.