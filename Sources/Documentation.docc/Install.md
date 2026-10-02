# Install Numio

## Homebrew

Add the Numio tap, trust its formula, and install:

```sh
brew tap neholos/numio https://github.com/neholos/numio-cli
brew trust --formula neholos/numio/numio
brew install numio
```

The trust command approves only the Numio formula. Review [the formula](https://github.com/neholos/numio-cli/blob/main/Formula/numio.rb) before installing if you prefer.

## Build from source

Install Swift, clone the repository, then build and run Numio:

```sh
git clone https://github.com/neholos/numio-cli.git
cd numio-cli
swift build
.build/debug/numio 12:30 + 02:15
```
