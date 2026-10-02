---
name: impact-analysis
description: Use before starting any feature or non-trivial change. Maps which modules, specs, ADRs, initiatives, flags, experiments and open issues it touches and reports conflicts. Read-only.
license: MIT
compatibility: opencode
metadata:
  audience: orchestrator
  mode: read-only
---
## What I do
Produce a one-page impact report so decisions start from facts, not archaeology.

## Steps
1. Read `docs/INDEX.md`. Filter by modules and tags the change could touch. Open only matches (TL;DR first).
2. Check `docs/initiatives.md`: is another initiative already touching the same module or behaviour? Name it.
3. Check accepted ADRs and `docs/specs/*` that constrain the change. Quote ids, not text.
4. Search the code (grep/glob) for the symbols and files involved. List owners from `AGENTS.md`/brief if present.
5. Check open GitHub issues that overlap (use `gh issue list` only if human allows; otherwise ask).
6. Platform/surface check: CLI, future Shortcuts/App Intents, future Mac app. State differences or write "same everywhere".
7. Release check: does it change CLI output or flags (breaking change for scripts)? Does it need a version bump?

## Output (max one page)
- Touches: modules / files / specs / ADRs (ids)
- Conflicts or overlaps: initiative ids, issues, in-flight branches
- Open questions for the DRI (max five)
- Proposed scope cut if appetite is exceeded
Cite `file:line`. Do not edit anything.