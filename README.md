# Numio CLI

Numio adds and subtracts times and durations from your terminal.

```sh
brew tap neholos/numio https://github.com/neholos/numio-cli
brew trust --formula neholos/numio/numio
brew install numio

numio 12:30 + 02:15
# 14:45
```

See the **[Numio guide](https://neholos.github.io/numio-cli/documentation/numio/guide)** for installation, expression syntax, examples, and limitations.

To build from source, run `swift build` and then `.build/debug/numio`. To run tests, use `swift test`.

Numio is licensed under the [MIT license](LICENSE.md).
