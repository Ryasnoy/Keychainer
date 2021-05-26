    import XCTest
    @testable import Keychainer
    
    final class KeychainerTests: XCTestCase {
        func testExample() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
            XCTAssertEqual(Keychainer(serviceName: "Default").accessGroup, "Hello, World!")
        }
    }
