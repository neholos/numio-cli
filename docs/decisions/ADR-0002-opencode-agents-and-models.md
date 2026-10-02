---
id: ADR-0002
title: OpenCode Agents and Model Assignment
type: adr
status: proposed
date: 2026-10-01
tags: [opencode, agents, models, privacy, cost]
owner: TBD
---
TL;DR: start on free Zen models (Nemotron 3 Ultra for planning/build, MiMo-V2.5 for verifier), different model families for author and reviewer, choice validated by bakeoff, not feeling.

## Context (as of 2026-09-29, source: opencode.ai/docs/zen)
Free Zen models: Big Pickle, Space Bunny Free, LongCat 2.5 Preview Free, MiMo-V2.6-Flash Free, MiMo-V2.5 Free, Ling 3.0 Flash Fin Free, Nemotron 3 Ultra Free, Nemotron 3.5 Lightning Free, Muse Spark 1.3 Contributor Free (and Jev 1.13 Free, not a chat model). **All marked free for limited time**: list changes. ID format: `opencode/<model-id>`.

Privacy in free period (per Zen docs):
- Big Pickle, MiMo-V2.6-Flash Free, MiMo-V2.5 Free, Ling 3.0 Flash Fin Free: data may be used to improve model.
- Nemotron 3 Ultra Free and 3.5 Lightning Free (NVIDIA endpoints): trial use only, don't send personal or confidential data; usage logged.
- Space Bunny Free and LongCat 2.5 Preview Free: zero retention, no training.
- Muse Spark 1.3 Contributor Free: reduced price in exchange for Meta's right to train on your prompts.

Quality evidence (all vendor or aggregators, no direct comparison):
- NVIDIA claims SWE-bench Verified 65–70.4% for Nemotron 3 Ultra across frameworks including OpenCode.
- BenchLM compares MiMo-V2.5 and Nemotron 3 Ultra, but no direct coding winner: benchmarks disagree.
- Kilo leaderboard: Nemotron 3 Ultra (free) ranks 10th in code mode.
Conclusion: best-supported free candidate for code is Nemotron 3 Ultra Free, alternative MiMo-V2.5 Free. "Best" model for your repo unknown until measured (docs/evals/model-bakeoff.md).

## Decision
| Agent | Mode | Model | Why |
|-------|------|-------|-----|
| orchestrator | primary | `opencode/nemotron-3-ultra-free` | planning; strongest free candidate |
| build | primary | `opencode/nemotron-3-ultra-free` | implementation in worktree |
| verifier | subagent | `opencode/mimo-v2.5-free` | **different model family**, so author and reviewer errors correlate less (reasoning, not proven fact) |
| docs-writer, explore, small_model | subagent | `opencode/nemotron-3.5-lightning-free` | fast and cheap for reading and text |

Different models per agent: yes, directly supported (`model` per agent). Subagents without explicit model inherit parent's.

## Privacy Rules
Repo is public and MIT, so code can go to any listed model. **No business notes, pricing, strategy, secrets in repo** and don't send to models that may train on prompts. If needed, Zen admin can disable specific models for the workspace.

## Financials and Setup
Register with Zen and add payment details even for free models. Reduce risk: monthly limit on workspace, auto-reload off (default $20 at balance below $5). Card fee passed at cost.

## Plan B (Free Models May Disappear)
Cheap paid alternatives from Zen pricing ($ per 1M tokens, in/out): DeepSeek V4 Flash 0.14/0.28, Qwen3.8 Flash 0.15/0.47, GLM 5.3 Flash 0.15/0.50, GPT 6 Luna 0.10/0.50. For review and planning use pricier models (e.g. Claude Sonnet 5 2/10 or GPT 6 Sol 2/10) if bakeoff shows free ones miss errors. Author of this kit is Claude from Anthropic, so account for possible bias and decide by bakeoff data.

## Parallelism
OpenCode subagents run in parent session's directory, so parallel implementers need separate worktrees and sessions. For reading (explore, verifier) parallelism is safe.

## Review
Monthly: check free model list, re-run bakeoff, update table.