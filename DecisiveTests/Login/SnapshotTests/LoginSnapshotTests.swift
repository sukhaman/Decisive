//
//  Created by Sukhaman Singh on 2/11/24.
//

import XCTest
@testable import Decisive

class LoginSnapshotTests: XCTestCase {
    
    func test_loginVC_iPhoneDevice() {
        let sut = makeSUT()
        record(snapshot: sut.snapshot(for: .iPhone(style: .dark)), named: "LOGIN_DARK_VIEW_iPhone")
        record(snapshot: sut.snapshot(for: .iPhone(style: .light)), named: "LOGIN_LIGHT_VIEW_iPhone")
    }
    
    func test_loginVC_iPadDevice() {
        let sut = makeSUT()
        record(snapshot: sut.snapshot(for: .iPad(style: .dark)), named: "LOGIN_DARK_VIEW_iPad")
        record(snapshot: sut.snapshot(for: .iPad(style: .light)), named: "LOGIN_LIGHT_VIEW_iPad")
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> LoginVC {
        let view = LoginVC()
        view.loadViewIfNeeded()
        return view
    }
}
