# Numio CLI

Numio CLI is a command-line tool written in Swift to perform time calculations. It allows users to add or subtract time in the `HH:mm` or `HH` format.

## Features

- Add or subtract time from a given starting time.
- Works with time inputs in the `HH:mm` or `HH` format.
- Supports simple time operations using `+` or `-` operators.

## Usage

### Command Format

The CLI accepts three arguments:
```zsh
numio <start-time> <operator> <add-time>
```

- **start-time**: The starting time in HH:mm or HH format.
- **operator**: Either + or - to add or subtract time.
- **add-time**: The time to add or subtract in HH:mm or HH format.
  
### Example

**Add Time**:
```zsh
numio 12:30 + 02:15
```

Output:
```zsh
14:45
```

**Subtract Time**:
```zsh
numio 14:45 - 01:30
```

Output:
```zsh
13:15
```

### Error Handling

- If an invalid time format is provided, the command will output an error message.
- If an invalid operator (other than + or -) is used, an error will be thrown.
- If the time calculation fails, an error message will be displayed.

## Installation

### Using Homebrew

```bash
brew install numio-cli
```

## Build from Source

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

## Contributing

If you'd like to contribute to this project, feel free to fork the repository, create a branch, and submit a pull request with your changes.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE.md](LICENSE.md) file for details.
