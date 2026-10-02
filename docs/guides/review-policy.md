---
id: GUIDE-0006
title: Review Policy by Risk and Escalation Rules
type: guide
status: active
date: 2026-10-01
tags: [review, delegation, escalation, quality, docs]
owner: TBD
---
TL;DR: review depends on change risk (T0–T3), not on who wrote it; human required for contracts, agent configs and releases, everything else goes through the verifier agent with sampled human review and escalation rules.

## 1. Tiers
Tier determined by `python3 scripts/review-tier.py <base>` from paths. Overall tier is the maximum across files.

| Tier | What | Who Reviews |
|------|------|-------------|
| T0 | ordinary docs: README, CHANGELOG, pitch, guides, evals, initiatives | `docs-reviewer` + CI; human not required |
| T1 | code inside one zone with tests (core, cli) | `verifier`; human spot-checks ~1 in 3 |
| T2 | contracts & configs: specs, ADRs, vectors, `Package.swift`, CI, scripts, `AGENTS.md`, `opencode.json`, agents, skills, zones, `Apps/mac` | `verifier` AND **human** |
| T3 | release & signing: release-workflow, Homebrew formula, entitlements | **human** + explicit go from DRI |

Unknown paths default to T2.

## 2. Why "Docs" Are Not Always T0
Documents that steer agents (`AGENTS.md`, specs, ADRs, skills, agent definitions, zones) are **configuration**: an error in them changes agent behaviour and breaks everything downstream. So they are T2. T0 is only descriptive docs.

## 3. How Not to Break Quality When Delegating Review to an Agent
- **Deterministic gates first:** `swift build`, `swift test`, vectors, scope check, `build-index.py --check`, `review-tier.py`. Agent reviewer adds judgement on top, not instead.
- **Different model than author:** so errors correlate less (reasoning, not proven fact).
- **Human sampling:** first 4 weeks check every 3rd T1 change, then adjust by defect escape rate.
- **Metrics:** post-release defects, T1 rollback rate, review queue time.
Industry telemetry shows review becomes a bottleneck when agents generate more changes; risk-based split avoids becoming a queue.

## 4. Exception-Based Control: When Human Intervenes
Agent stops and escalates (report with one clear reason) if:
1. change is T2/T3 or needs to exceed allowed paths;
2. `verifier` returns FAIL twice in a row on one task;
3. step limit exhausted (`steps`) without green result;
4. product question appears with no answer in spec;
5. contract C1-C3 touched (ADR-0005);
6. over half of appetite spent and gates not passed.
Everything else agents prove without you. You decide only on these triggers and at gates G1–G3.

## 5. Shared Files (README, etc.): One Writer, Many Contributors
Shared file is a hot spot, so one owner edits it (agent `docs-writer` under docs DRI). Teams don't edit directly; they include a **Docs impact** section in each report: which files/sections to update and proposed text, or "none". Then `docs-writer` consolidates in one pass, `docs-reviewer` validates. `review-tier.py` warns if code changed but README/CHANGELOG didn't.

## 6. GitHub Setup (after moving to PRs)
Main branch protection, required statuses (`swift test`, `build-index.py --check`), mandatory review by `CODEOWNERS` for T2/T3.