---
name: practice-check
description: Use when I ask whether something (formatting, naming, output format, UX detail, structure) should be changed. Runs a quick advisory crew - internal rules via explore, external best practices and Apple guidelines via researcher - then returns a verdict FIX / LEAVE / DECIDE with evidence. Advisory only.
license: MIT
compatibility: opencode
metadata:
  audience: orchestrator
  mode: advisory
---
## Time box
About 10 minutes. One page of output.

## Steps
1. Restate the question in one sentence and name the artifact (file, CLI output, screen). If unclear, ask exactly one question.
2. Dispatch in parallel:
   - `explore`: what do OUR docs already say? Search `docs/INDEX.md` tags, specs, ADRs, zone docs, AGENTS.md and README for rules that cover this. Return the rules (ids) and the current behaviour with `file:line`.
   - `researcher`: what do authoritative external sources say? Apple Human Interface Guidelines, Swift API Design Guidelines, Command Line Interface Guidelines, standards such as ISO 8601, as relevant. Return 3-5 cited findings and how well each applies.
3. Compare the current behaviour with both. Note any conflict between our rules and external guidance.
4. Verdict, exactly one of:
   - **FIX**: current behaviour contradicts our own rule or strong external guidance. Give the smallest patch (describe, do not apply), its blast radius (surfaces, tests, vectors; is it a contract change, which makes it T2) and the cost.
   - **LEAVE**: consistent with our rules, or the guidance is weak or not applicable. Two sentences why.
   - **DECIDE**: sources disagree or it is a taste call. Two options and a recommendation.
5. Confidence (high/medium/low) and what would change your mind.
6. If the result is a decision others will rely on, offer an ADR draft (do not write it unasked).

## Rules
Advisory only: never edit code or docs. Separate cited facts from opinions. Cite only pages the researcher actually fetched.
Public sources only; no private notes in web queries. The human decides; any change then follows the normal flow (brief, worktree, review tier).