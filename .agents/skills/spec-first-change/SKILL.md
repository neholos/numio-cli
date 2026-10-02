---
name: spec-first-change
description: Use for any change to time parsing, arithmetic or output formatting. Enforces spec -> examples -> tests -> code order and keeps docs/specs/time-grammar.md the single source of truth.
license: MIT
compatibility: opencode
metadata:
  audience: implementer
  workflow: tdd
---
## What I do
Keep behaviour changes predictable by making the spec and its examples drive tests and code.

## Steps
1. Read the relevant section of `docs/specs/time-grammar.md` (not the whole file).
2. If the behaviour is unspecified, stop and ask the DRI. If it is an open decision (D-n), do not pick silently.
3. Update the spec: grammar rule and at least three acceptance examples, including one edge case.
4. Turn each new example into a failing test in `Tests/`. Run `swift test` and confirm the failure. If SwiftPM reports that no test target exists, stop and ask before adding test infrastructure; never treat "no tests found" as a pass.
5. Implement the smallest change in the existing Swift sources under `Sources/`. Keep CLI changes to argument handling and printing.
6. Run `swift build` and `swift test`. Fix only what the task requires.
7. Report any output change that could break scripts.

## Edge cases to always consider
Midnight wrap, negative results, 24:00, seconds, leading zeros, missing minutes, invalid input, multiple operands.