---
id: GUIDE-0009
title: Solo Flow: Working with Agents in OpenCode
type: guide
status: active
date: 2026-10-01
tags: [solo, workflow, opencode, onboarding, daily-loop]
owner: TBD
---
TL;DR: you wear three hats (Product, Zone, Reviewer); agents are your staff. Daily loop: brief → worktree → build → review → merge. Start with just `orchestrator`, `build`, `verifier`.

## Prerequisites (One-Time)
```bash
# 1. Copy operating kit to repo root
git checkout -b chore/operating-kit
cp -r files/numio-kit/* .
# 2. Build index
python3 scripts/build-index.py
# 3. Configure OpenCode
opencode
/connect          # select Zen
/models           # verify model IDs match opencode.json
```

## Daily Commands

| Command | Agent | Purpose |
|---------|-------|---------|
| `/brief <task>, issue #N` | `orchestrator` | Impact analysis → writes `docs/briefs/<date>-<slug>.md` → outputs worktree command |
| `/review <base-branch>` | `orchestrator` → `review-tier.py` → `verifier` or `docs-reviewer` | Determines tier (T0–T3), runs appropriate reviewer |
| `/practice-check <question>` | `orchestrator` → `explore` + `researcher` (parallel) | Returns FIX/LEAVE/DECIDE with evidence; makes no changes |
| `/sync-docs <brief-file>` | `docs-writer` → `docs-reviewer` | Updates README/CHANGELOG from "Docs impact", validates, rebuilds index |
| `opencode --agent build` | `build` | Implements task from brief in worktree |

**Switch agents in TUI:** Use agent selector (not Tab — verify key binding in your OpenCode version).

## Task Loop

### 1. Plan
Pick one initiative from `docs/initiatives.md`.

### 2. Brief
```
/brief add seconds parsing, issue #42
```
Read the generated brief (`docs/briefs/...`). Verify: scope, allowed paths, acceptance examples. **Edit the brief if wrong — this controls the agent.**

If task is underspecified → orchestrator proposes shaping spike. See `docs/guides/shaping-underspecified-work.md`.

### 3. Implement
```bash
scripts/new-task.sh <slug> build docs/briefs/<file>.md
cd ../numio-<slug>
opencode --agent build
```
In TUI: `Execute task from docs/briefs/<file>.md`

**Permissions:** `swift build` / `swift test` are pre-approved. Other commands prompt.
- `/undo` — revert last turn + file changes (stacked)
- `/redo` — reapply

### 4. Review
```
/review main
```
Read output: tier, verdict, top findings, manual checks required.
- T1: spot-check every 3rd diff
- T2/T3: read full diff

### 5. Merge & Cleanup
```bash
git diff --name-only main   # confirm scope
swift test                  # must pass
# merge via PR or direct
git worktree remove ../numio-<slug>
# update initiatives.md status
```

### 6. Docs
```
/sync-docs docs/briefs/<file>.md
```

### 7. Log Friction
Append to `docs/evals/friction-log.md` — what blocked you.

## When Stuck

| Problem | Fix |
|---------|-----|
| Agent loops | `/undo`, narrow brief, restart session |
| Weak output | `/models` → switch model, retry; log in bakeoff |
| Too many permission prompts | Add command to `permission.bash` in `opencode.json` (T2 change) |
| Unsure about merge | `/review main`; if T2/T3 or doubtful, read diff yourself |
| Don't know next step | `/brief` for next initiative or `/practice-check` for question |
| Context bloated | New session with brief (compaction enabled in config) |

## First Two Tasks (Onboarding)

1. **Tiny (T0/T1):** Complete full loop — typo fix or single test. Goal: verify every step works.
2. **Medium (T1):** Run `/practice-check` on a real question, then fix per result.

After both: review friction log, fix 1–2 items.

## Key Files

| File | Role |
|------|------|
| `docs/initiatives.md` | Roadmap + DRI assignments |
| `docs/briefs/<date>-<slug>.md` | Task contract: scope, paths, acceptance |
| `docs/specs/time-grammar.md` | Spec-first: update examples + tests before code |
| `docs/evals/friction-log.md` | Blockers log |
| `docs/decisions/ADR-XXXX-*.md` | Architectural decisions (append-only) |
| `opencode.json` | Models, permissions, agents, compaction |
| `scripts/review-tier.py` | Tier classifier (T0–T3) |
| `scripts/new-task.sh` | Creates worktree + branch + launches agent |

## Rollout

| Phase | Enable | Defer |
|-------|--------|-------|
| Week 1 | orchestrator, build, verifier, docs-writer, docs-reviewer, researcher | team-core, team-cli, crew |
| Week 2–3 | + vectors, ADR, spec enforcement | parallel worktrees |
| Week 4+ | team-core, team-cli (after NumioCore split) | cross-cutting crews |

Spotlight / `team-mac` parked (I-006).