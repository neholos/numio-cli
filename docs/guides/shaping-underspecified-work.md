---
id: GUIDE-0007
title: Working with Underspecified Complex Features (Shaping)
type: guide
status: active
date: 2026-10-01
tags: [shaping, discovery, spike, appetite, predictability]
owner: TBD
---
TL;DR: an underspecified feature is first shaped by a human in a short spike (collaboration), producing a pitch + examples + contract drafts + unknowns register; only after gate G0 does work go to agents.

## Why This Matters
Agents work best on well-scoped tasks: research shows gains concentrate there, while high-context expert work risks pure losses. An unshaped fuzzy feature gives unpredictability, not speed. Predictability comes from appetite, gates, and reducing unknowns, not from more agents.

## Shaping Phase (Before Any Agent Brief)
1. **Time-box:** 1–2 days. Collaboration mode with human, orchestrator, and `explore` agents.
2. **Unknowns register** (table: what is unknown, why it matters, how to resolve, who, status). Types: fact, assumption, decision.
3. **Research:** `explore` checks code, docs, issues; returns half-pages with references.
4. **Spike:** smallest code or experiment that de-risks the riskiest assumption. Throwaway.
5. **Exit:**
   - pitch (problem, appetite, rabbit holes, no-gos, what to cut if appetite exceeded)
   - acceptance examples (table input → output) with unknowns marked
   - contract drafts C1-C3 (ADR-0005)
   - remaining unknowns list with resolution plan

## Gate G0 (Human)
Go, no-go, or "one more spike". Go criteria: main risks resolved, acceptance examples exist, appetite honest, named DRI. Before G0 agents write no production code.

## After G0
Per zone: brief per zone, worktree, delivery phases (GUIDE-0005). Unknowns discovered during implementation go back into the unknowns register, not silently resolved by the agent.

## What This Gives a Senior Developer
A senior developer naturally takes shaping in their zone: they have context, routine implementation goes to agents. This offloads you to product and strategic decisions.