---
description: Turn a short idea into an impact report and a task brief (no code).
agent: orchestrator
---
Idea or task: $ARGUMENTS

Do this:
1. Load the skill `impact-analysis` and follow it. Read `docs/INDEX.md` first and open only matching docs.
2. Write a task brief to `docs/briefs/<yyyy-mm-dd>-<slug>.md` from `docs/briefs/_template.md`:
   allowed paths, acceptance examples (input → output), tests, Docs impact, risks. Name me as DRI.
3. If the idea is underspecified (unknowns that change scope), say so and propose a shaping spike
   (`docs/guides/shaping-underspecified-work.md`) instead of a brief.
4. End with: the exact `scripts/new-task.sh` command (agent `build`) and the three things I should check in the brief.