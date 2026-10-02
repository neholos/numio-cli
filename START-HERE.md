# Numio Operating Kit: Getting Started

Kit for repo `neholos/numio-cli`: agent rules, OpenCode config, skills, docs, index script. Weekend work order: `docs/weekend-plan.md`.

## Read in This Order
1. `docs/guides/solo-flow.md`: your daily flow (start today).
2. `docs/weekend-plan.md`: broader plan.
3. Rest on demand via `docs/INDEX.md`. Spotlight and `team-mac` deferred.

## What's Inside
```
AGENTS.md                   agent rules (short, always in context)
opencode.json               models, permissions, compaction
.opencode/agents/           orchestrator, verifier, docs-writer, docs-reviewer, researcher, team-core, team-cli
.opencode/commands/         /brief, /review, /practice-check, /sync-docs
.agents/skills/             impact-analysis, decision-brief, spec-first-change, release-homebrew
docs/                       operating-model, pitches, ADR 0001–0005, spec, initiatives, evals, weekend-plan
scripts/new-task.sh         worktree + brief + launch feature team
scripts/review-tier.py      review tier (T0–T3) by changed paths + warnings
scripts/build-index.py      generates docs/INDEX.md and validates metadata (--check)
```

## Apply (10 min)
1. `git checkout -b chore/operating-kit`
2. Copy kit contents to repo root. **Do not overwrite repo README.**
3. `python3 scripts/build-index.py`
4. `opencode`, then `/connect` → OpenCode Zen. In Zen account: set monthly limit, disable auto-reload.
5. `opencode models` and verify IDs match `opencode.json`. `opencode debug config` shows final config.
6. In session `/init`: OpenCode updates `AGENTS.md` in place, review diff.

## Pre-Start Checks (I Couldn't Verify)
- **OpenCode version.** Docs as of 2026-09-29 indicate v2 released. Config and schema written for current docs (opencode.ai/docs); if you have v2, cross-check with opencode.ai/v2/docs.
- **Model IDs and free list.** All Zen free models marked temporary. If an ID disappears, `opencode models` shows replacement.
- **Repo structure.** I haven't seen code (`Package.swift`, `Sources`, tests). `AGENTS.md` describes target structure; current commands and paths need confirmation.
- **Current CLI behaviour.** In `docs/specs/time-grammar.md` the "Current" column is empty: run the examples.
- **Tap repo name.** Likely `neholos/homebrew-numio`, inferred from `brew tap neholos/numio`.

## For a Team with a Developer
Read as needed: `docs/guides/onboarding-developer.md`, `review-policy.md` (review tiers and escalation), `shaping-underspecified-work.md` (fuzzy features), `cross-cutting-delivery.md` (cross-cutting features).

## Answers to Your Questions
- **Best free model:** strongest candidate Nemotron 3 Ultra Free, alternative MiMo-V2.5 Free. No independent head-to-head exists, so bakeoff decides (`docs/evals/model-bakeoff.md`). Privacy details and caveats: ADR-0002.
- **Different models per agent:** yes, configured: different model family for verifier.
- **DocC:** yes, but only for `NumioCore` API and after API stabilises; process docs stay Markdown. ADR-0003.