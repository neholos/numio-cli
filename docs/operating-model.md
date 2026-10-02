---
id: GUIDE-0001
title: Numio Operating Model (Two People and Agents)
type: guide
status: active
date: 2026-10-01
tags: [management, process, agents]
owner: TBD
---
TL;DR: focus on ≤3 initiatives, one DRI per item, written pitch/ADR, weekly demo, agents as staff with permissions and review.

## 1. Principles
1. **Focus.** No more than three active initiatives. A new initiative starts only when one closes or is parked.
2. **One DRI.** One person owns each initiative, task, and decision. Agents are never DRI.
3. **Write Before Build.** For anything over a few days, there's a pitch (PR/FAQ-lite). If you can't write a compelling release, rework or kill the idea before code.
4. **Appetite Over Estimation.** Decide first how much time it's worth. Cut scope, don't extend deadline.
5. **Decide by Expertise.** Agree upfront who has final say: product/UX and code/architecture. Tie-break decided before the argument, not during.
6. **Show Working Software.** Weekly demo of working software, even if rough.
7. **Taste Is Practice.** "Native feel" quality checked daily: use your own product.

## 2. Roles and Decision Rights
| Zone | DRI | Final Say |
|------|-----|-----------|
| Product, wedge, priorities | TBD | TBD |
| Code, architecture, releases | TBD | TBD |
| Design/UX (when app appears) | TBD | TBD |

Agents: orchestrator plans and writes specs, build implements, verifier checks. Accountability always with human.

## 3. Rhythm
| When | What | Outcome |
|------|------|---------|
| Monday, 30 min | pick ≤3 priorities, name DRI | updated `initiatives.md` |
| Friday, 30–45 min | demo working, what's next | decisions recorded (ADR/log) |
| Every 2–3 weeks | retro + bets for next cycle | new pitch or kill |
| Monthly | wedge still current? remove stale (flags, docs, issues), check free model list | clean index and registers |

## 4. Artefacts (Where Things Live)
- Idea or feature over a few days: `docs/pitches/` (template `0000-template.md`).
- Decisions: `docs/decisions/` (ADR).
- Behaviour: `docs/specs/` (examples become tests).
- What's in progress: `docs/initiatives.md`.
- Task for agent: `docs/briefs/` (template `_template.md`).

## 5. Rules
- No DRI or brief = no start.
- One worktree per task. Small PRs.
- Scope hammer: don't overcommit — cut scope.
- Definition of done: build and tests pass, spec/docs updated, ADR if decision made, CHANGELOG, named owner after release, flag removal date (if any).
- Deferred decision without a date is also a decision. Fix when we return to it.

## 6. Agents as Staff
- Permissions and roles: `.opencode/agents/` and `opencode.json` (see ADR-0002).
- Autonomy: agent may change only paths from brief; shared files ruled by orchestrator or human.
- Review: author and verifier are different. Verifier uses a different model so errors don't correlate.
- Context loaded on demand (ADR-0004), not preloaded.

## 7. Metrics (Pick Three Max)
Candidates: returning users (how to measure, decide in wedge pitch), pitch-to-release time, fraction of tasks passing verification first try. Don't invent numbers upfront: baseline first over 2–3 weeks.

## 8. What's Borrowed and What's Not
Borrowed from Apple: DRI, narrow focus, experts decide, weekly demos and reviews. From Amazon: written PR/FAQ. From Linear: 1–3 week projects by 1–3 people. From Shape Up: appetite, rabbit holes, no-gos. Not taken: secrecy, Jobsian rigidity, large functional departments. Sources: `guides/principles-and-sources.md`.

## 9. Two People
Agree upfront who decides what. Work slots separate from rest of life. This small thing saves both product and relationship.