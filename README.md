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

Start with a scoped issue, make the change in its worktree, and run the relevant build and tests. See the [OpenCode development flow](docs/operating-model.md) for prompt guidance, verification, and delivery.

Numio is licensed under the [MIT license](LICENSE.md).
