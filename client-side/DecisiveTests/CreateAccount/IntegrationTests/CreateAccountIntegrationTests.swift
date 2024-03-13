//
//  Created by Sukhaman Singh on 3/10/24.
//

import XCTest
@testable import Decisive

class CreateAccountIntegrationTests: XCTestCase {
    
    func testCreateAccount_createAccountButtonTapped_finishWithError() {
        let sut = makeSUT()
        let mockNavigation = MockNavigationController(rootViewController: sut)
        let router = CreateAccountRouter(navigationController: mockNavigation)
        sut.router = router
        sut.firstNameView.txtTitle.text = "Any"
        sut.lastNameView.txtTitle.text = "Last"
        sut.phoneView.txtTitle.text = "1234567890"
        sut.emailView.txtTitle.text = "any@test.com"
        sut.passwordView.txtTitle.text = "valid@123"
        sut.confirmPasswordView.txtTitle.text = "valid@123"
        sut.btnCreate.sendActions(for: .touchUpInside)
        let expectation = XCTestExpectation(description: "Server response recieved")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
        let alertController = mockNavigation.presentViewController as? UIAlertController
        XCTAssertNotNil(alertController)
        let expectedAlertMessage = "Bad Request"
        let actualAlertMessage = alertController?.message
        XCTAssertEqual(expectedAlertMessage, actualAlertMessage)
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> CreateAccountVC {
        let view = CreateAccountVC()
        view.viewModel = RegistrationViewModel(service: RegistrationAPIServiceSpy())
        view.loadViewIfNeeded()
        return view
    }

}
