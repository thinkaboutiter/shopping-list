import XCTest
@testable import ShoppingList

final class ShoppingListTests: XCTestCase {
    
    func testExample() throws {
        // sample test
        let result = 0
        XCTAssertEqual(result, 0, "Ooops!")
    }

    /// Returns path to the built products directory.
    var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
