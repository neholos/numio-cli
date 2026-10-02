# Numio

Numio is a Swift CLI for predictable time arithmetic. Keep behavior small and explicit.

## Current project
- CLI sources: `Sources/`; package manifest: `Package.swift`.
- `docs/specs/time-grammar.md` is the behavior reference. `docs/INDEX.md` is generated.
- The future `NumioCore`/app layout is described in ADR-0001; do not create it without an approved task.

## Commands
```sh
swift build
swift test
swift run numio 12:30 + 02:15
python3 scripts/build-index.py --check
```
After editing docs metadata, run `python3 scripts/build-index.py`.

## Change rules
1. Work from a human-owned issue or brief; keep the DRI and scope explicit.
2. For time behavior changes, update the spec and tests first. Ask the DRI about unspecified behavior or open D- decisions; do not guess.
3. Keep work isolated to the current task worktree. Do not push, merge, or commit unless asked.
4. Run the relevant build/tests. Use the read-only `verifier` for independent review when risk warrants it; agent-config and release changes also need human review.
5. Preserve user-facing CLI output unless the task explicitly changes it. Report README/CHANGELOG impact rather than editing them without scope.
6. Never put secrets or private business information in this public repository or model prompts.

## OpenCode
- Default: `implementer` on `opencode/nemotron-3-ultra-free`; independent reviewer: `verifier`.
- Use `.agents/skills/spec-first-change` for time behavior and `release-homebrew` for releases, only when relevant.
- Keep ordinary work direct: no planner chain, extra agents, or new worktree scripts unless parallel work is actually needed.
