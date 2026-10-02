---
id: GUIDE-0004
title: Feature Teams with Agents: How to Form and Keep in Bounds
type: guide
status: active
date: 2026-10-01
modules: [NumioCore, cli]
tags: [agents, teams, ownership, worktree, sync]
owner: TBD
---
TL;DR: an agent feature team = owned paths + narrow permissions + charter in prompt + separate worktree and session + briefs and verifier; add a new team only when an independent module appears and your review is the bottleneck.

## 1. What a Team Consists Of
| Component | Where It Lives | Purpose |
|-----------|----------------|---------|
| Ownership boundary | table below + agent `edit` rights | don't step on each other |
| Charter | body of `.opencode/agents/team-*.md` | what the team does, doesn't, and its contract |
| Narrow permissions | `permission.edit` on only its paths | technical, not verbal boundary |
| Isolation | worktree + separate session (`scripts/new-task.sh`) | parallelism without clobbering |
| Input and output | brief in, half-page report out | clear handoff |
| Gate | `verifier` (different model) + you | quality independent of author |

Module rules belong in the team prompt or a skill, not in a nested `AGENTS.md`: per OpenCode docs, `AGENTS.md` lookup walks up from the current directory, so a nested file won't be picked up if the session starts from root, while `instructions` loads everything always.

## 2. Ownership Map
| Team | Agent | Owns | Read-only |
|------|-------|------|-----------|
| core | `team-core` | `Packages/NumioCore/**`, `docs/specs/**` | rest |
| cli | `team-cli` | `Apps/cli/**` | NumioCore, specs |
| mac (later) | `team-mac` | `Apps/mac/**` (App Intents, shell, signing, release) | NumioCore; contracts C1-C3 per ADR-0005 |
| docs (README, CHANGELOG) | `docs-writer` (single writer) + `docs-reviewer` | `README.md`, `CHANGELOG.md`, `docs/**` | teams give Docs impact section |
| platform/shared | human or orchestrator | `Package.swift`, `opencode.json`, `AGENTS.md`, `docs/decisions/**`, build root | |

Shared files (hot spots) changed by one party at a time: human or orchestrator, sequentially.

## 3. How to Launch a Team on a Task
1. Orchestrator does impact-analysis and writes brief (`docs/briefs/`): goal, allowed paths, acceptance examples.
2. `scripts/new-task.sh <slug> team-core <brief>` creates worktree, branch, and brief.
3. `cd ../numio-<slug> && opencode --agent team-core`, or headless: `opencode run --agent team-core --dir ../numio-<slug> "Do the task in <brief>"`.
4. Before merge: `git diff --name-only <base>` must match allowed paths; `verifier` checks against brief and spec.
5. Merge sequentially, small PRs; after each merge rebase remaining branches and rerun tests.

## 4. Synchronisation Without Overlap
- **Contracts over conversations.** Public NumioCore API (with `///`), spec, and CHANGELOG are the interface between teams. Contract change goes in brief and in ADR if irreversible.
- **Cross-team request:** a team doesn't reach into foreign paths; it describes the need in its report; orchestrator creates a brief for the zone owner.
- **Files as memory:** `initiatives.md`, briefs, ADRs. Not chat.
- **No more than three active initiatives**, one team per initiative.

## 5. Verify Boundaries Actually Hold (Smoke Test)
`permission.edit` works on path patterns; behaviour must be confirmed in your OpenCode version:
1. Run `team-cli` in a test worktree and ask it to change a file in `Packages/NumioCore/`.
2. Expected: denial or prompt. If agent could change the file, narrow patterns, check `opencode debug config`, don't trust the boundary until fixed.
3. Always keep final scope check via `git diff --name-only`.

## 6. When to Add a New Team
For Numio right now, roles (orchestrator, build, verifier) and separate worktrees per task are enough. `team-core` and `team-cli` make sense after I-001 when the core/cli boundary is clear. `team-mac` only after accepted Spotlight pitch. Trigger for each: independent module, own test suite, and at least two queued tasks that don't touch the same files.
Your review is the bottleneck: if you have >2–3 PRs waiting for verification, don't add teams, clear the queue first.

## 7. What Teams Don't Get
Taste, priorities, final product decisions. Agent does the task within the brief; "what are we building" stays yours.