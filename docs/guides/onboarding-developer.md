---
id: GUIDE-0008
title: Onboarding a New Developer
type: guide
status: active
date: 2026-10-01
tags: [onboarding, team, zones, process]
owner: TBD
---
TL;DR: new developer reads the minimum, takes a small T1 task with a brief, then becomes a zone DRI and shapes fuzzy features; context comes from the repo, not from founders' heads.

## Day 1: What to Read (Minimum)
1. `AGENTS.md`
2. `docs/operating-model.md` sections 1–5
3. `docs/INDEX.md` and your zone document (`docs/zones/<zone>.md`)
4. `docs/guides/review-policy.md` (tiers T0–T3, escalation)
Find the rest via the index when needed, just like agents do.

## First 2 Days: Setup
OpenCode, Zen key, `opencode models`, `swift build`, `swift test`, run CLI with examples from the spec.

## Week 1
- Small T1 task with a ready brief and `scripts/new-task.sh`. Goal: complete the full cycle (brief → worktree → verifier → review → merge → demo).
- Paired session 30 min: "what changed and why" (ADRs, vectors).
- Add or fix one "zone": `docs/zones/<zone>.md` (invariants, entry points, pitfalls).

## Weeks 2–4
- Become zone DRI: own zone contracts, `CODEOWNERS`, zone agent team.
- Take first fuzzy case and run shaping (GUIDE-0007) to G0.
- Own T1 reviews in your zone; you review T2/T3.

## Expectations and Agreements
- Escalate per review-policy triggers, not by feeling.
- Everything decided goes into ADR/spec. Verbal agreements don't exist.
- Biweekly 30 min retro: what blocked, what to clarify in docs.

## What You Get
Predictability (appetite, gates, vectors), context in files not heads, less review on you (T0/T1 by agents), and a zone you run independently.