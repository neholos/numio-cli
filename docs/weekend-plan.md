---
id: GUIDE-0003
title: Weekend Plan (Start)
type: guide
status: active
date: 2026-10-01
tags: [plan, weekend, setup]
owner: TBD
---
TL;DR: Saturday: kit, OpenCode, wedge, extract NumioCore, model bakeoff; Sunday: spec, two features in parallel worktrees, demo.

## Saturday (~5 hrs)
1. **Kit into repo (30 min).** Branch `chore/operating-kit`, copy kit contents to root (don't overwrite repo README), `python3 scripts/build-index.py`.
2. **OpenCode (30 min).** `opencode --version` (v2 released, see START-HERE). Register with Zen, `/connect`, **set monthly limit and disable auto-reload** (default tops up $20 at balance below $5). `opencode models` and verify IDs vs `opencode.json`. `opencode debug config` to see final config. Then `/init`: it updates `AGENTS.md` in place (review diff).
3. **Wedge and Owners (60 min, together).** Fill `docs/pitches/0001-wedge.md`, set DRI in `docs/initiatives.md` and `docs/operating-model.md` §2, pick **one** project for first cycle.
4. **I-001: Extract NumioCore (90–120 min).** `build` in worktree, from brief. Criterion: CLI behaviour unchanged, tests green. Before this, ensure tests exist; if not, write characterisation tests first.
5. **Model Bakeoff (45 min).** Per `docs/evals/model-bakeoff.md`: 3 tasks × 2 models, fill table.

## Sunday (~4 hrs)
6. **Spec (60 min).** Close open decisions D-1..D-4 in `docs/specs/time-grammar.md`, record ADR.
7. **Two Features in Parallel (120 min).** Issue #2 (seconds) and #11 (`1h + 24min`) in two worktrees and two `opencode` sessions. Verifier checks each.
8. **Demo to Each Other (20 min)** and pick ≤3 priorities for Monday.

## If Time Left
- CI: `python3 scripts/build-index.py --check`.
- `Documentation.docc` skeleton for NumioCore (ADR-0003).
- Start I-003: release automation.

## Weekend Success Criteria
NumioCore extracted, two features merged with verification, model for `build` chosen by data not feeling, all decisions recorded.