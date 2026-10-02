---
id: GUIDE-0001
title: Numio Operating Model
type: guide
status: active
date: 2026-10-02
tags: [management, process, agents]
owner: TBD
---
TL;DR: one human owns each task; give OpenCode a precise issue, work in that issue's worktree, verify with deterministic checks, and add independent review only when risk justifies it.

## Effective OpenCode flow

1. **Start in the task worktree.** Create or select one isolated worktree for the issue, then launch OpenCode from that repository root or open that directory in the UI. Check the displayed project path before editing: OpenCode merges global and project configuration, with project configuration overriding conflicting global values; project `opencode.json` and `.opencode/` agent files are discovered from the project. The configured project default is `implementer` on Nemotron 3 Ultra Free. If a different model or agent appears, check the selected project and active agent before starting. The setup was exercised in the TUI; the local web UI endpoint returned HTTP 200, but agent selection was not interactively checked there.
2. **Give a bounded brief.** Use a human-owned issue or a short prompt that states the outcome, scope, acceptance examples, constraints, and verification commands. Small, clear tasks can go directly to `implementer`; do not create a plan document just to restate a small issue.
3. **Plan only when uncertainty warrants it.** When a behavior change has unresolved decisions or the approach is unclear, use the built-in `plan` agent to inspect the relevant spec and code and list unresolved decisions. The agent must not choose an open product decision. The human resolves it, the spec/examples are updated, and only then does implementation begin.
4. **Implement one coherent change.** Ask the `implementer` to stay within the issue scope, add or update tests, run the checks, and report changed files and exact results. If a required action is blocked, inspect the matching permission: approve an `ask` request in the UI when appropriate; a `deny` rule blocks the action and needs a human to run it or deliberately change the policy. Never work around a denial or retry the same blocked command in alternate forms.
5. **Verify the result.** Review `git diff` against the issue. Run `swift build` and `swift test` for Swift changes, plus representative `swift run numio ...` examples for CLI behavior. Run `python3 scripts/build-index.py --check` after documentation metadata changes. Use `verifier` (MiMo-V2.6 Flash Free) for an independent, read-only review when the change is non-trivial; give it the acceptance criteria and ask for file/line evidence.
6. **Apply the risk gate and deliver.** Run `python3 scripts/review-tier.py <base>`. A verifier does not replace human review for T2 changes or T3 releases. Commit, push, open a PR, or merge only when the human owner requests it.

## Writing prompts for free models

Free models are more reliable when the task is explicit and small. Include:

- **Goal and scope:** what outcome is required and which files or behavior may change.
- **Acceptance examples:** exact input and expected output, including a relevant edge case.
- **Constraints:** compatibility to preserve, decisions not to guess, and work explicitly out of scope.
- **Verification:** exact commands to run and what passing output means.
- **Handoff:** request changed-file list, test results, unresolved questions, and docs impact.

For example: “Implement issue #N only. Preserve the existing CLI contract except for the listed examples. Add tests for each example before changing behavior; update the time grammar spec first. Run `swift test`, `swift build`, and these CLI examples. Do not change unrelated docs or commit. Report the diff and exact check results.”

## Agents and parallel work

- **`implementer`** is the default for scoped changes. **`plan`** is for resolving uncertainty without edits. **`verifier`** is a separate read-only review, not a mandatory extra stage for every typo or small change.
- Delegate only independent work that can be stated with separate inputs and outputs; keep a single human integrator and one owner for shared files. Do not create an agent team for routine work.
- In trials on 2026-10-03, parallel subagent calls with the configured free Zen models returned a provider error. Direct implementer-to-verifier delegation worked from both CLI and TUI. Until parallel calls are confirmed working in the user's client/provider path, use one implementer, deterministic checks, and optional verifier rather than repeatedly retrying or enabling parallelism by default.
- When a free-model provider call fails, preserve the task and evidence, then continue directly or retry once through the interactive OpenCode UI. Do not infer that all OpenCode clients or all providers share the same failure.

## Where things live
- Work in progress: `docs/initiatives.md`.
- Product bets: `docs/pitches/`.
- Durable decisions: `docs/decisions/`.
- Behavior and examples: `docs/specs/`.
- Optional task details: `docs/briefs/_template.md`.

No weekly ritual, multi-agent chain, or recurring metric is required. Add process only to solve a demonstrated recurring problem.
