// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Foundation

private enum TimeExpressionKind {
    case clock
    case duration
}

private struct TimeValue {
    let totalSeconds: Int
    let kind: TimeExpressionKind
    let includesSeconds: Bool
}

private enum TimeExpressionError: LocalizedError {
    case noExpression
    case invalidExpression(String)
    case invalidRange(String)

    var errorDescription: String? {
        switch self {
        case .noExpression:
            return "No time expression provided. Example: numio 12:30 + 02:15"
        case .invalidExpression(let message):
            return message
        case .invalidRange(let message):
            return message
        }
    }
}

func tokenize(_ input: [String]) -> [String] {
    var tokens: [String] = []
    var current = ""

    for segment in input {
        for character in segment {
            if character == "+" || character == "-" {
                if !current.isEmpty {
                    tokens.append(current)
                    current = ""
                }
                tokens.append(String(character))
            } else if character.isWhitespace {
                if !current.isEmpty {
                    tokens.append(current)
                    current = ""
                }
            } else {
                current.append(character)
            }
        }

        if !current.isEmpty {
            tokens.append(current)
            current = ""
        }
    }

    return tokens
}

private func parseClock(_ value: String) throws -> TimeValue {
    let components = value.split(separator: ":", omittingEmptySubsequences: false)
    guard !components.isEmpty else {
        throw TimeExpressionError.invalidExpression("Invalid time expression: \(value)")
    }

    let parsed = try components.map { component -> Int in
        guard !component.isEmpty, let number = Int(component) else {
            throw TimeExpressionError.invalidExpression("Invalid time value: \(value)")
        }
        return number
    }

    let hour: Int
    let minute: Int
    let second: Int

    switch parsed.count {
    case 1:
        hour = parsed[0]
        minute = 0
        second = 0
    case 2:
        hour = parsed[0]
        minute = parsed[1]
        second = 0
    case 3:
        hour = parsed[0]
        minute = parsed[1]
        second = parsed[2]
    default:
        throw TimeExpressionError.invalidExpression("Invalid time value: \(value)")
    }

    if hour < 0 || hour > 24 {
        throw TimeExpressionError.invalidRange("Invalid hour in \(value)")
    }
    if minute < 0 || minute > 59 {
        throw TimeExpressionError.invalidRange("Invalid minute in \(value)")
    }
    if second < 0 || second > 59 {
        throw TimeExpressionError.invalidRange("Invalid second in \(value)")
    }
    if hour == 24 && (minute != 0 || second != 0) {
        throw TimeExpressionError.invalidRange("Hour 24 can only be used with 00 minutes and seconds.")
    }

    let totalSeconds = hour * 3_600 + minute * 60 + second
    return TimeValue(totalSeconds: totalSeconds, kind: .clock, includesSeconds: parsed.count == 3)
}

private func parseDuration(_ text: String) throws -> TimeValue {
    let value = text.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    guard !value.isEmpty else {
        throw TimeExpressionError.invalidExpression("Missing operand")
    }

    let allowedUnits: [String: Int] = [
        "h": 3_600,
        "hr": 3_600,
        "hrs": 3_600,
        "hour": 3_600,
        "hours": 3_600,
        "m": 60,
        "min": 60,
        "mins": 60,
        "minute": 60,
        "minutes": 60,
        "s": 1,
        "sec": 1,
        "secs": 1,
        "second": 1,
        "seconds": 1,
    ]

    var totalSeconds = 0
    var hasSecondsUnit = false
    var index = value.startIndex
    var sawComponent = false

    while index < value.endIndex {
        while index < value.endIndex, value[index].isWhitespace {
            index = value.index(after: index)
        }
        guard index < value.endIndex else { break }

        let numberStart = index
        while index < value.endIndex, value[index].isNumber {
            index = value.index(after: index)
        }

        guard numberStart != index else {
            throw TimeExpressionError.invalidExpression("Invalid duration: \(text)")
        }

        let digits = String(value[numberStart..<index])
        guard let amount = Int(digits) else {
            throw TimeExpressionError.invalidExpression("Invalid duration: \(text)")
        }

        let unitStart = index
        while index < value.endIndex, value[index].isLetter {
            index = value.index(after: index)
        }
        let unit = String(value[unitStart..<index]).lowercased()

        if unit.isEmpty {
            totalSeconds += amount * 3_600
        } else {
            guard let factor = allowedUnits[unit] else {
                throw TimeExpressionError.invalidExpression("Unsupported unit \(unit) in \(text)")
            }
            if factor == 1 {
                hasSecondsUnit = true
            }
            totalSeconds += amount * factor
        }

        sawComponent = true
    }

    guard sawComponent else {
        guard let valueAsHours = Int(value), valueAsHours >= 0 else {
            throw TimeExpressionError.invalidExpression("Invalid duration: \(text)")
        }
        return TimeValue(totalSeconds: valueAsHours * 3_600, kind: .duration, includesSeconds: false)
    }

    return TimeValue(totalSeconds: totalSeconds, kind: .duration, includesSeconds: hasSecondsUnit)
}

private func parseOperand(_ tokens: [String]) throws -> TimeValue {
    let joined = tokens.joined(separator: " ")
    if joined.contains(":") {
        return try parseClock(joined)
    }
    return try parseDuration(joined)
}

private func normalizeClock(_ totalSeconds: Int) -> Int {
    let wrapped = totalSeconds % 86_400
    return wrapped >= 0 ? wrapped : wrapped + 86_400
}

private func formatClock(_ totalSeconds: Int, includeSeconds: Bool) -> String {
    let normalized = normalizeClock(totalSeconds)
    let hours = normalized / 3_600
    let minutes = (normalized / 60) % 60
    let seconds = normalized % 60

    if includeSeconds {
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    return String(format: "%02d:%02d", hours, minutes)
}

private func formatDuration(_ totalSeconds: Int, includeSeconds: Bool) -> String {
    let sign = totalSeconds < 0 ? "-" : ""
    let absoluteSeconds = abs(totalSeconds)
    let hours = absoluteSeconds / 3_600
    let minutes = (absoluteSeconds / 60) % 60
    let seconds = absoluteSeconds % 60

    if includeSeconds {
        return String(format: "%@%02d:%02d:%02d", sign, hours, minutes, seconds)
    }
    return String(format: "%@%02d:%02d", sign, hours, minutes)
}

func evaluateExpression(_ input: [String]) throws -> String {
    let tokens = tokenize(input)
    guard !tokens.isEmpty else {
        throw TimeExpressionError.noExpression
    }

    if tokens.count == 1 {
        let single = tokens[0].trimmingCharacters(in: .whitespacesAndNewlines)
        if single.lowercased() == "24:00" || single.lowercased() == "24:00:00" {
            return "24:00"
        }
    }

    var pendingOperator = "+"
    var currentOperand: [String] = []
    var totalSeconds: Int?
    var firstKind: TimeExpressionKind?
    var includeSeconds = false

    func finalizeOperand() throws {
        guard !currentOperand.isEmpty else { return }
        let value = try parseOperand(currentOperand)
        if firstKind == nil {
            firstKind = value.kind
            totalSeconds = value.totalSeconds
            includeSeconds = value.includesSeconds
        } else {
            guard let runningTotal = totalSeconds else {
                throw TimeExpressionError.invalidExpression("Unable to evaluate expression")
            }
            let adjusted = pendingOperator == "+" ? runningTotal + value.totalSeconds : runningTotal - value.totalSeconds
            totalSeconds = adjusted
            includeSeconds = includeSeconds || value.includesSeconds
        }
        currentOperand = []
    }

    for token in tokens {
        if token == "+" || token == "-" {
            try finalizeOperand()
            pendingOperator = token
        } else {
            currentOperand.append(token)
        }
    }

    try finalizeOperand()

    guard let finalSeconds = totalSeconds, let kind = firstKind else {
        throw TimeExpressionError.invalidExpression("Malformed time expression")
    }

    switch kind {
    case .clock:
        return formatClock(finalSeconds, includeSeconds: includeSeconds)
    case .duration:
        return formatDuration(finalSeconds, includeSeconds: includeSeconds)
    }
}

@main
struct NumioCLI: ParsableCommand {
    @Argument(help: "Time expression such as 12:30 + 02:15 or 1h + 24min")
    var expression: [String]

    func run() throws {
        guard !expression.isEmpty else {
            throw TimeExpressionError.noExpression
        }

        let result = try evaluateExpression(expression)
        print(result)
    }
}
