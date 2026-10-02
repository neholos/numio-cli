---
id: ADR-0004
title: Docs as Lazy Context
type: adr
status: proposed
date: 2026-10-02
tags: [context, docs, agents, skills]
owner: TBD
---
TL;DR: keep always-loaded instructions short; load specs and the few task-specific skills only when relevant.

## Decision
1. Keep `AGENTS.md` to durable project facts, commands, and behavior/safety constraints.
2. Use `docs/INDEX.md` to find relevant docs; open only the sections needed.
3. Keep `docs/specs/time-grammar.md` as the behavior authority. Do not copy its examples into always-loaded instructions.
4. Keep a skill only for a recurring procedure with enough detail to justify loading it on demand. Current examples: `spec-first-change` and `release-homebrew`.
5. Do not add files to OpenCode's always-included `instructions` unless a demonstrated retrieval failure justifies it.

## Evidence and limits
- OpenCode documents that agent instructions/rules and skills are loaded through distinct mechanisms ([rules](https://opencode.ai/docs/rules/), [skills](https://opencode.ai/docs/skills/)); GitHub recommends short repository instructions ([repository instructions](https://docs.github.com/en/copilot/how-tos/copilot-on-github/customize-copilot/add-custom-instructions/add-repository-instructions)). These are product documentation and vendor guidance, not controlled evidence of a speedup.
- A repository-guidance preprint reports improved SWE-bench resolution with targeted guidance, but it used a different model/setup and is not peer-reviewed ([Shepard & Albrecht, 2026](https://arxiv.org/abs/2606.20512v2)).
- Multi-agent topology results are task-dependent; a recent preprint reports quality/cost tradeoffs across projects, not this CLI or Nemotron 3 Ultra ([MSEval, 2026](https://arxiv.org/abs/2607.27877v1)).
- Context-position effects have been measured in a long-context study, but it does not validate a specific OpenCode configuration ([Liu et al., 2023](https://arxiv.org/abs/2307.03172)).

Treat these sources as reasons to keep configuration small and test consequential changes, not as proof of runtime or quality gains for Numio. No cited study evaluates OpenCode with Nemotron 3 Ultra Free.

## Static cleanup check (2026-10-02)
| Inventory | Before | After |
|-----------|--------|-------|
| Always-loaded `AGENTS.md` lines | 61 | 30 |
| OpenCode JSON configuration lines | 274 | 32 |
| Custom agent profiles | 8 | 2 |
| On-demand skills | 5 | 2 |
| Slash commands | 8 | 1 |
| Required orchestration actions for a routine task | 11 | 3, with review conditional on risk |

These are repository inventory counts, not prompt-token, latency, or model-quality measurements.

Removed unused planner/team/documentation-agent roles and their command chain, the one-shot nested-worktree helper, duplicate root onboarding pages, multi-team templates/guides, and recurring retrieval/friction checklists. Kept the behavior spec, product pitch, short operating/review guidance, the task-specific spec/release skills, and an on-demand model comparison protocol.
