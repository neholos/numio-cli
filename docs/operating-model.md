---
id: GUIDE-0001
title: Numio Operating Model
type: guide
status: active
date: 2026-10-02
tags: [management, process, agents]
owner: TBD
---
TL;DR: one human owns each task; use the issue as the brief, implement in its isolated worktree, run checks, and add independent review only when risk justifies it.

## Working rules
- The issue or short brief names a human DRI, outcome, and scope. Small tasks do not need a separate planning document.
- Keep each task in one isolated worktree. Do not spawn nested worktrees or agent teams for routine work.
- Keep product behavior in `docs/specs/`; update its examples and tests before behavior code. Ask rather than guessing at an open decision.
- Run `swift build` and `swift test` for code changes; run the docs index check after metadata changes.
- The `implementer` handles scoped work. Use the read-only `verifier` for independent checks when risk warrants it. Agent/config and release changes require human review.
- Do not push, merge, or commit without the human DRI's request.

## Where things live
- Work in progress: `docs/initiatives.md`.
- Product bets: `docs/pitches/`.
- Durable decisions: `docs/decisions/`.
- Behavior and examples: `docs/specs/`.
- Optional task details: `docs/briefs/_template.md`.

No weekly ritual, multi-agent chain, or recurring metric is required. Add process only to solve a demonstrated recurring problem.
