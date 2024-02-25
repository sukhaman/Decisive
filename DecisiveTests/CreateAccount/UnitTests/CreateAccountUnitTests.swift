//
//  Created by Sukhaman Singh on 2/25/24.
//


import XCTest
@testable import Decisive

class CreateAccountUnitTests: XCTestCase {
    
    func test_createAccount_firstNameLabelHasText() {
        let sut = makeSUT()
       let expectedResult = "First Name:"
        let actualResult = sut.firstNameView.lblTitle.text
        XCTAssertEqual(expectedResult, actualResult)
    }
    
    func test_createAccount_lastNameLabelHasText() {
        let sut = makeSUT()
       let expectedResult = "Last Name:"
        let actualResult = sut.lastNameView.lblTitle.text
        XCTAssertEqual(expectedResult, actualResult)
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> CreateAccountVC {
        let view = CreateAccountVC()
        view.loadViewIfNeeded()
        return view
    }
}
