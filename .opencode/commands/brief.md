---
description: Turn a short idea into an impact report and a task brief (no code).
agent: orchestrator
---
Idea or task: $ARGUMENTS (issue number, slug, or description)

Do this:
1. Load the skill `impact-analysis` and follow it. Read `docs/INDEX.md` first and open only matching docs.
2. Read `docs/initiatives.md` to find matching initiative and DRI.
3. Write a task brief to `docs/briefs/<yyyy-mm-dd>-<slug>.md` from `docs/briefs/_template.md`:
   - DRI (human), Initiative ID, Allowed/Forbidden paths, Acceptance examples, Tests, Docs impact, Risks.
4. If underspecified (unknowns that change scope), propose shaping spike instead (`docs/guides/shaping-underspecified-work.md`).
5. End with: exact `scripts/new-task.sh <slug> implementer` command and three things human must verify in brief.

## Usage
```
/brief 8
/brief swift6-migration
/brief "Add seconds support to parser"
```