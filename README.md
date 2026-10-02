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

## 📄 License

This project is licensed under the [MIT license](LICENSE.md).
