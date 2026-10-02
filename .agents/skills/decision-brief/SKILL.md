---
name: decision-brief
description: Use before a product or architecture decision. Assembles a one-page decision brief (options, constraints, related ADRs/initiatives, evidence, risks) from the repo docs and code on demand, without loading all docs.
license: MIT
compatibility: opencode
metadata:
  audience: orchestrator
  mode: read-only
---
## What I do
Turn scattered context into a one-page brief a human can decide from in five minutes.

## Steps
1. State the decision in one sentence and who the DRI is.
2. Retrieve cheaply: grep `docs/INDEX.md` and frontmatter by tag/module/status first; also look for rejected or superseded items on the same topic (do not re-litigate silently).
3. Open only the relevant docs. Read TL;DR, then the section you need.
4. For heavy reading (more than five docs), delegate to an `explore` subagent and ask for a half-page summary with references.
5. Write the brief:
   - Decision and deadline
   - Options (2-4), each with cost, risk, reversibility (one-way vs two-way door)
   - Constraints: specs, ADRs, appetite, release/support impact
   - Evidence and its quality; what is unknown
   - Recommendation with reasoning (clearly marked as a recommendation)
6. Offer an ADR draft only after the human decides.

## Rules
Keep it to one page. Link doc ids instead of pasting. Separate facts from opinions.