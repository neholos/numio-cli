---
id: EVAL-0001
title: Model Comparison When Needed
type: eval
status: active
date: 2026-10-02
tags: [models, opencode, evaluation]
owner: TBD
---
TL;DR: do not run recurring model bakeoffs; compare models only when a concrete quality or cost question needs an answer.

## Protocol
1. Pick one small and one representative open task with objective acceptance criteria.
2. Use the same starting commit, task text, tools, and permission scope for each model; use fresh sessions.
3. Compare test/build outcome, out-of-scope edits, defects found in human review, and elapsed time/usage where available.
4. Repeat a run only when randomness could change the conclusion. Record the result and limits; do not generalize beyond the tested model/version/tasks.

## Current evidence
No controlled comparison has been run for Nemotron 3 Ultra Free on this repository. Published agent studies and model leaderboards use different repositories, models, and setups; they are reasons to test locally, not proof of a winner. Static reductions in agent count or instruction length are not runtime-performance measurements.
