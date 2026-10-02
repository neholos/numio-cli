---
id: GUIDE-0007
title: Shaping Underspecified Work
type: guide
status: active
date: 2026-10-02
tags: [shaping, discovery, appetite]
owner: TBD
---
TL;DR: shape genuinely uncertain, multi-day product work with a human before implementation; small, specified changes need only an issue and tests.

## When to shape
Use this for work where unresolved product or technical unknowns could materially change scope. Do not require it for routine fixes or small, already specified changes.

## Lightweight shaping
1. Name the human DRI and agree an appetite.
2. List only the unknowns that affect the decision or implementation.
3. Use the smallest research check or spike to resolve the riskiest unknown.
4. Agree on acceptance examples, explicit no-gos, and what to cut if the appetite is exceeded.
5. Record durable decisions in an ADR or behavior rules in the relevant spec.

After the human decision, use the issue or brief and one isolated worktree. Raise newly discovered product questions to the DRI; do not silently expand scope or create an agent team.
