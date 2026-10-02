# Numio

Numio is a Swift CLI for predictable time arithmetic.

- CLI source: `Sources/`; tests: `Tests/`.
- `docs/specs/time-grammar.md` is the product behavior contract.
- Verify Swift changes with `swift build` and `swift test`.

## Working rules
- Work from one Git worktree per task. A new OpenCode chat does not isolate files.
- Follow the issue's scope. For time behavior, update the spec and tests before implementation; ask about unresolved behavior.
- Review `git diff` and run the checks relevant to the change. Do not claim a check passed unless you ran it.
- Commit, push, open or merge a PR only when the human owner explicitly asks; never infer authorization from an issue or PR description. The configured GitHub and Git delivery commands are available to Build, while other shell commands still require approval.
- Do not add process docs, scripts, or agents unless a recurring problem justifies them.
- Never put secrets or private business information in prompts or this public repository.

Use the default OpenCode Build agent for implementation. Load `spec-first-change` for time behavior and `release-homebrew` for releases; no subagent is needed for routine work.

Use Plan only when requirements or approach are unclear. Use the built-in `@explore` subagent only to locate unfamiliar code; return to Build for edits and tests.
