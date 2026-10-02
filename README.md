# Numio CLI

Numio CLI is a command-line tool written in Swift to perform time calculations. It allows users to add or subtract time in the `HH:mm` or `HH` format.

## ✨ Features

- Add or subtract time from a given starting time.
- Works with time inputs in the `HH:mm` or `HH` format.
- Supports simple time operations using `+` or `-` operators.

## 🖥️ Usage

### Command Format

Numio accepts a small time expression with `+` and `-` operators:
```zsh
numio <expression>
```

Examples:
- `numio 12:30 + 02:15`
- `numio 00:10 - 00:20`
- `numio 12:00 + 1h 24min - 00:10`

Supported operand forms:
- clock times: `HH`, `HH:mm`, `HH:mm:ss`
- durations: `1h`, `24min`, `90s`, `1h 24min`
- bare numbers are treated as hours

### Error Handling

- If an invalid time format is provided, the command will output an error message.
- If an invalid operator (other than + or -) is used, an error will be thrown.
- If the time calculation fails, an error message will be displayed.

## ⚙️ Installation

### Using Homebrew

The Homebrew formula is maintained in this repository.

```bash
brew tap neholos/numio https://github.com/neholos/numio-cli
brew trust --formula neholos/numio/numio
brew install numio
```

Homebrew requires explicit trust for formulae from third-party taps. This trusts
only Numio's formula, not every formula in the tap. If you want to inspect what
Homebrew will install, review the [formula](Formula/numio.rb) first.

## 🏗️ Build from Source

If you prefer to build the project yourself, follow these steps:

1. Clone the repository:
   ```zsh
   git clone https://github.com/neholos/numio-cli.git
   ```
2. Navigate to the project directory:
   ```zsh
   cd numio-cli
   ```
3. Build the project using Swift:
   ```zsh
   swift build
   ```
4. You can now run the executable:
   ```zsh
   .build/debug/numio
   ```

## 🤝 Contributing

If you'd like to contribute to this project, feel free to fork the repository, create a branch, and submit a pull request with your changes.

### Using OpenCode

1. Start OpenCode at the repository root, or open that repository in its UI. Project instructions in `AGENTS.md`, settings in `opencode.json`, and agents in `.opencode/` are project-scoped.
2. Start with a GitHub issue that states the human owner, desired outcome, scope, and acceptance examples. For a small, clear change, ask the `implementer` directly; use `plan` first when behavior or approach is still unclear.
3. Keep the change isolated to that issue. For time behavior, settle the spec examples before implementation. Ask the human owner rather than guessing at unresolved product decisions.
4. Have the implementer run `swift build`, `swift test`, and relevant `swift run numio ...` examples. Review the diff against the issue; use the read-only `verifier` for non-trivial changes, and keep human review for T2/T3 changes.
5. Use multiple agents only for independent work that can be split cleanly. Parallel subagents with the free Zen models failed in 2026-10-03 trials, so fall back to one implementer, deterministic checks, and the optional verifier unless the provider path is confirmed working. Always integrate and verify the combined result before opening a pull request.

See the [OpenCode development flow](docs/operating-model.md) for prompt guidance, agent roles, permissions, verification, and delivery details.

## 📄 License

This project is licensed under the [MIT license](LICENSE.md).
