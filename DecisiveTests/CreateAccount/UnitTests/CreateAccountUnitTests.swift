//
//  Created by Sukhaman Singh on 2/25/24.
//


import XCTest
@testable import Decisive

class CreateAccountUnitTests: XCTestCase {
    
    func test_createAccount_firstNameLabelHasText() {
        let sut = makeSUT()
       let expectedResult = localized("first_name")
        let actualResult = sut.firstNameView.lblTitle.text
        XCTAssertEqual(expectedResult, actualResult)
    }
    
    func test_createAccount_lastNameLabelHasText() {
        let sut = makeSUT()
       let expectedResult = localized("last_name")
        let actualResult = sut.lastNameView.lblTitle.text
        XCTAssertEqual(expectedResult, actualResult)
    }
    
    func test_createAccount_emailLabelHasText() {
        let sut = makeSUT()
       let expectedResult = localized("email")
        let actualResult = sut.emailView.lblTitle.text
        XCTAssertEqual(expectedResult, actualResult)
    }
    
    func test_createAccount_phoneLabelHasText() {
        let sut = makeSUT()
       let expectedResult = localized("phone")
        let actualResult = sut.phoneView.lblTitle.text
        XCTAssertEqual(expectedResult, actualResult)
    }
    
    func test_createAccount_passwordLabelHasText() {
        let sut = makeSUT()
       let expectedResult = localized("password")
        let actualResult = sut.passwordView.lblTitle.text
        XCTAssertEqual(expectedResult, actualResult)
    }
    
    func test_createAccount_confirmPasswordLabelHasText() {
        let sut = makeSUT()
       let expectedResult = localized("confirm_password")
        let actualResult = sut.confirmPasswordView.lblTitle.text
        XCTAssertEqual(expectedResult, actualResult)
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> CreateAccountVC {
        let view = CreateAccountVC()
        view.loadViewIfNeeded()
        return view
    }
    
    private func localized(_ key: String, file: StaticString = #filePath, line: UInt = #line) -> String {
        let table = "CreateAccount"
        let bundle = Bundle(for: CreateAccountVC.self)
        let value = bundle.localizedString(forKey: key, value: nil, table: table)
        if value == key {
            XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
        }
        return value
    }
}
