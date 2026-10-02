---
id: GUIDE-0005
title: Cross-Cutting Features: Temporary Delivery Crew
type: guide
status: active
date: 2026-10-01
modules: [NumioCore, cli, mac]
tags: [delivery, crew, interaction-modes, contracts, integration, teams]
owner: TBD
---
TL;DR: for a feature touching all surfaces, assemble a temporary crew with one delivery-DRI who owns the outcome and integration, while standing teams keep code ownership; interaction follows phases: contracts, thin cross-cutting slice, parallel fill, integration, close.

## 1. Principle: Outcome Owner Differs from Code Owner
- Standing teams (`team-core`, `team-cli`, `team-mac`) own code and their contracts.
- Crew owns the **outcome**: feature works end-to-end, integrated, released. It doesn't rewrite others' code; it coordinates, slices work, and holds quality gates.
- Crew is temporary: has a completion date and exit criteria, then disbands.

## 2. Interaction Modes (Team Topologies)
For each team pair, choose a mode consciously:

| Mode | When | Rule |
|------|------|------|
| Collaboration | opening a new boundary, agreeing a contract | high bandwidth, **temporary**, with end date; no more than one partner at a time |
| X-as-a-Service | stable mode: one consumes another's contract | no meetings, only a clear interface (core API, vectors) |
| Facilitating | one side upskills the other | temporary, until self-sufficient |

Anti-pattern: "everything is collaboration": endless syncs and fuzzy ownership. If a team constantly needs collaboration, it's a service design problem, not a people problem. In crew, collaboration lives only in the contract phase, then switch to X-as-a-Service.

## 3. How to Form a Crew (Minutes, Not Days)
1. **Trigger:** feature changes contracts (C1-C3, ADR-0005) or touches two or more ownership zones.
2. **Charter on one page** (`docs/briefs/_delivery-plan-template.md`): outcome, delivery-DRI (human), appetite and end date, composition (teams/agents), interaction modes, gates, exit criteria.
3. **Composition:** delivery-DRI (human); orchestrator as coordinator and plan lead; one agent from each touched zone; `verifier` as integration checker.
4. **Constraints:** one crew per initiative, ≤3 active initiatives (operating model). Two people: one runs delivery, the other reviews; swap roles next feature.

## 4. Delivery Phases
| Phase | What Happens | Exit (Gate) |
|-------|--------------|-------------|
| 0. Charter | impact-analysis, appetite, DRI, modes | plan ready |
| 1. Contracts First | agree C1 (API), C2 (vectors), C3 (error/string mapping) before code | **G1: contracts frozen** |
| 2. Thin Cross-Cutting Slice | thinnest working path through all surfaces behind a flag | **G2: slice green end-to-end** |
| 3. Parallel Fill | teams in separate worktrees, one owner per file; requests into foreign zones via brief | all briefs done |
| 4. Integration | sequential merge (core, then cli, then mac), vectors on all surfaces, `verifier` | **G3: integration verified** |
| 5. Close | release, CHANGELOG, docs, flag removal date, retro, disband | exit criteria met |

Thin slice (G2) catches surface mismatches early while cheap; risk doesn't accumulate at integration end.

## 5. Interaction Protocol
- **Files over chats:** plan in `docs/briefs/<feature>/plan.md` (from template), orchestrator updates, delivery-DRI sees status.
- **Sync only at gates G1/G2/G3** and on blockers. Blocker >1 day: delivery-DRI decides.
- **Cross-zone request:** described in team report, orchestrator creates brief for zone owner. Nobody touches foreign paths.
- **Contract change after G1:** only via delivery-DRI and recorded in plan; after change rerun vectors on all surfaces.
- **Decoupling by flag:** every surface enables feature behind a flag so it doesn't block releases through others; plan states flag removal date.

## 6. Numio Example: Seconds (#2) on All Surfaces
Outcome: `12:30:15 + 00:00:50` gives `12:31:05` in CLI and Spotlight intent. Delivery-DRI: TBD. Phase 1: C1 (result type with seconds), C2 (vectors with seconds), C3 (invalid seconds error mapping). Phase 2: slice core + cli behind flag, then mac. Gate G3: vectors green on core, CLI, and intents.

## 7. How to Know Crew Isn't Needed
If change is in one zone and doesn't change contracts, it's a normal task for one team with a brief. Crew is expensive on attention; don't introduce it "just in case".