import XCTest
@testable import numio

final class NumioCLITests: XCTestCase {
    func testAddsClockTimes() throws {
        XCTAssertEqual(try evaluateExpression(["12:30", "+", "02:15"]), "14:45")
    }

    func testWrapsAtMidnightForClockArithmetic() throws {
        XCTAssertEqual(try evaluateExpression(["23:30", "+", "01:00"]), "00:30")
    }

    func testWrapsNegativeClockResult() throws {
        XCTAssertEqual(try evaluateExpression(["00:10", "-", "00:20"]), "23:50")
    }

    func testEvaluatesMixedDurationAndClockInput() throws {
        XCTAssertEqual(try evaluateExpression(["12:00", "+", "1h", "24min", "-", "00:10"]), "13:14")
    }

    func testFormatsDurationOutput() throws {
        XCTAssertEqual(try evaluateExpression(["1h", "+", "24min"]), "01:24")
    }

    func testFormatsSecondsWhenAnyOperandContainsSeconds() throws {
        XCTAssertEqual(try evaluateExpression(["12:30:15", "+", "00:00:50"]), "12:31:05")
    }

    func testRejectsInvalidTimeRanges() {
        XCTAssertThrowsError(try evaluateExpression(["12:75"]))
    }
}
