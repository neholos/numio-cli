import Testing
@testable import numio

@Suite("Numio CLI time expression evaluation")
struct NumioCLITests {

    @Test("Adds clock times")
    func testAddsClockTimes() throws {
        #expect(try evaluateExpression(["12:30", "+", "02:15"]) == "14:45")
    }

    @Test("Wraps at midnight for clock arithmetic")
    func testWrapsAtMidnightForClockArithmetic() throws {
        #expect(try evaluateExpression(["23:30", "+", "01:00"]) == "00:30")
    }

    @Test("Wraps negative clock result")
    func testWrapsNegativeClockResult() throws {
        #expect(try evaluateExpression(["00:10", "-", "00:20"]) == "23:50")
    }

    @Test("Evaluates mixed duration and clock input")
    func testEvaluatesMixedDurationAndClockInput() throws {
        #expect(try evaluateExpression(["12:00", "+", "1h", "24min", "-", "00:10"]) == "13:14")
    }

    @Test("Formats duration output")
    func testFormatsDurationOutput() throws {
        #expect(try evaluateExpression(["1h", "+", "24min"]) == "01:24")
    }

    @Test("Formats seconds when any operand contains seconds")
    func testFormatsSecondsWhenAnyOperandContainsSeconds() throws {
        #expect(try evaluateExpression(["12:30:15", "+", "00:00:50"]) == "12:31:05")
    }

    @Test("Rejects invalid time ranges")
    func testRejectsInvalidTimeRanges() {
        #expect(throws: Error.self) {
            try evaluateExpression(["12:75"])
        }
    }
}
