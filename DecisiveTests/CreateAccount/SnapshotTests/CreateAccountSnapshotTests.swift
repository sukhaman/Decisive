//
//  Created by Sukhaman Singh on 2/25/24.
//

import XCTest
@testable import Decisive

class CreateAccountSnapshotTests: XCTestCase {
    
    func test_createAccount_iPhoneDevice() {
        let sut = makeSUT()
        record(snapshot: sut.snapshot(for: .iPhone(style: .dark)), named: "CREATE_ACCOUNT_DARK_VIEW_iPhone")
        record(snapshot: sut.snapshot(for: .iPhone(style: .light)), named: "CREATE_ACCOUNT_LIGHT_VIEW_iPhone")
    }
    
    func test_createAccount_iPadDevice() {
        let sut = makeSUT()
        record(snapshot: sut.snapshot(for: .iPad(style: .dark)), named: "CREATE_ACCOUNT_DARK_VIEW_iPad")
        record(snapshot: sut.snapshot(for: .iPad(style: .light)), named: "CREATE_ACCOUNT_LIGHT_VIEW_iPad")
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> CreateAccountVC {
        let view = CreateAccountVC()
        view.loadViewIfNeeded()
        return view
    }
}
