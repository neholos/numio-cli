# Numio CLI

Numio adds and subtracts times and durations from your terminal.

```sh
brew tap neholos/numio https://github.com/neholos/numio-cli
brew trust --formula neholos/numio/numio
brew install numio
```

```sh
numio 12:30 + 02:15
# 14:45
```

See the **[Numio guide](https://neholos.github.io/numio-cli/documentation/numio/guide)** for installation, expression syntax, examples, and limitations.

To build from source, run `swift build` and then `.build/debug/numio`. To run tests, use `swift test`.

## Contributing with OpenCode

For each issue, start OpenCode in its Git worktree and use the default Build agent to implement the change and run relevant checks. Use Plan when requirements are unclear and `@explore` to locate unfamiliar code. A new chat alone does not isolate changes, so use a separate worktree for concurrent tasks. Review the diff and tests; explicitly ask for commit, push, or PR actions when ready.

Numio is licensed under the [MIT license](LICENSE.md).
