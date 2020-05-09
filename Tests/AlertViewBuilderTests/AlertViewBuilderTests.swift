import XCTest
@testable import AlertViewBuilder

final class AlertViewBuilderTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(AlertViewBuilder().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
