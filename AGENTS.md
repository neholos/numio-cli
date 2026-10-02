# Numio — Agent Rules

Read this first. Details live in `docs/`, `.agents/skills/` and are loaded on demand.

## Product
Numio is a time-arithmetic utility: add and subtract time correctly and predictably.
Today: a Swift CLI (`numio 12:30 + 02:15` → `14:45`). Direction: reliable core engine (`NumioCore`), CLI first, later Shortcuts/Spotlight (App Intents) and a Mac app.
Scope decisions in `docs/pitches/`. Do not expand scope on your own.

## Target Layout
Migration tracked in `docs/initiatives.md` (I-001). Verify with `ls` before assuming paths.

```
Packages/NumioCore/   pure Swift: parsing, arithmetic, formatting. No I/O, no CLI code.
Apps/cli/             thin CLI wrapper: args, printing, exit codes
Apps/mac/             future. Do not create without accepted pitch.
docs/                 pitches, decisions (ADR), specs, initiatives. docs/INDEX.md generated.
.agents/skills/       on-demand playbooks (load with skill tool)
.opencode/agents/     agent definitions. opencode.json = models and permissions.
```

## Commands (verify once, then keep accurate)
```
swift build
swift test
swift run numio 12:30 + 02:15
python3 scripts/build-index.py          # regenerate docs/INDEX.md
python3 scripts/build-index.py --check  # validate docs metadata (CI)
```

## Working Agreement
1. Every task has a named human DRI (issue or brief). Agents are never DRI. No DRI or brief → stop and ask.
2. Load context lazily. Start from `docs/INDEX.md`, grep frontmatter (modules, tags, status), open only matching docs, read TL;DR first. Never read all of `docs/`.
3. Spec first. Behaviour changes update `docs/specs/time-grammar.md` (examples table) and tests before code. Ask before changing an accepted spec.
4. Scope. Edit only paths listed in the brief. Shared files (`Package.swift`, `opencode.json`, `AGENTS.md`, `docs/decisions/*`) change only via orchestrator or human. Need more scope? Stop and ask.
5. Isolation. One task = one git worktree and branch: `git worktree add ../numio-<slug> -b agent/<slug>`. Small PRs. Never push to main. Never force-push.
6. Tests. Bug fix starts with a failing test. Cover spec edge cases (midnight wrap, negative results, 24:00, invalid input).
7. Independent verification. Author does not approve own work. `verifier` agent (or human) checks against brief and spec.
8. Definition of done: build and tests pass; spec/docs updated; ADR if decision made; CHANGELOG line; named owner after release; no TODO without issue number.
9. Privacy. Repo is public. Never commit secrets or business-sensitive notes (some free models may train on prompts). Private strategy stays outside repo.
10. Unsure about product intent? Ask the DRI. Do not guess.

## Review Tiers and Escalation
Run `python3 scripts/review-tier.py <base>` before review. T0 docs: `docs-reviewer`. T1 code in a zone: `verifier` (+ human sample). T2 contracts/config (specs, ADR, AGENTS.md, opencode.json, agents, skills, scripts, CI, Package.swift, Apps/mac): `verifier` AND human. T3 release/signing: human + explicit go. Docs that steer agents are config (T2), not T0.
Escalate to human only on: T2/T3 change, two verifier FAILs in a row, step limit reached, unanswered product question, contract change, half of appetite spent. Details: `docs/guides/review-policy.md`.
Underspecified feature? Shape it first (`docs/guides/shaping-underspecified-work.md`); no agent briefs before gate G0.
Do not edit README/CHANGELOG from a feature team: report a **Docs impact** section instead; `docs-writer` is their single writer.

## Conventions
- Code, comments, commit messages: English. Docs may be Ukrainian. Frontmatter keys always English.
- Public `NumioCore` API gets `///` doc comments (feed DocC later, see ADR-0003).
- Reports to human: at most one page, with `file:line` references. Do not paste code back.

## Agents
`orchestrator` (plans, specs, briefs; never edits code) → `build` or feature team (`team-core`, `team-cli`; implements in own worktree, only in owned paths) → `verifier` (read-only review plus tests).
Helpers: `explore`, `docs-writer`, `docs-reviewer`, `researcher`. Start a task with `scripts/new-task.sh`. See `docs/guides/feature-teams.md`.
Cross-cutting features (touch 2+ zones or change contracts C1-C3) get temporary delivery crew with one delivery-DRI: see `docs/guides/cross-cutting-delivery.md`.
Models and permissions: `opencode.json` and `docs/decisions/ADR-0002-opencode-agents-and-models.md`.

## Skills (load on demand)
`impact-analysis` before starting a feature · `decision-brief` before a product/architecture decision · `spec-first-change` for any behaviour change · `release-homebrew` when cutting a release · `practice-check` when asked whether something should change (advisory FIX / LEAVE / DECIDE).
Slash commands: `/brief`, `/review`, `/practice-check`, `/sync-docs` (see `.opencode/commands/`).