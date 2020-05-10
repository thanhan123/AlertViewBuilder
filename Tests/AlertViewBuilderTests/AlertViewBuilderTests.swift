import XCTest
import UIKit
@testable import AlertViewBuilder

final class AlertViewBuilderTests: XCTestCase {
    func testExample() {
        let cancel = true

        let alert = UIAlertController.makeAlert {
            AlertComponent.title("")
            AlertComponent.message("")
            AlertComponent.action(
                UIAlertAction(title: "Ok", style: .default, handler: { _ in
                    print("***> clicked Ok")
                })
            )
            if cancel {
                AlertComponent.action(
                    UIAlertAction(title: "Cancel", style: .default, handler: { _ in
                        print("***> clicked cancel")
                    })
                )
            }
        }

        XCTAssertNotNil(alert)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
