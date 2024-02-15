//
//  Created by Sukhaman Singh on 2/11/24.
//

import XCTest
import Combine
@testable import Decisive

class LoginIntegrationTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    
    func test_loginVC_sendLoginRequestFailure() {
            // Arrange
            // Simulate an invalid URL
        let request = URLRequest(url: LoginEndpoint.login.url)
            let module = LoginAPIClientStub()
            
            let expectation = XCTestExpectation(description: "Login request should fail")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
        }
            // Act
            module.sendLoginRequest(from: request)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        XCTFail("Login request should fail")
                    case .failure(let error):
                        let expectedError = URLError(.unsupportedURL)
                        let actualError = error as! URLError
                        XCTAssertEqual(actualError, expectedError)
                    }
                }, receiveValue: { _ in })
                .store(in: &cancellables)
            
            // Wait for the expectation to be fulfilled
            wait(for: [expectation], timeout: 5) // Adjust the timeout as needed
        }
    
    func test_loginVC_showHomeScreen() {
            // Arrange
            let sut = makeSUT()
        sut.txtEmail.text = "test@test.com"
        sut.txtPassword.text = "1234"
            let mockNavigation = MockNavigationController(rootViewController: sut)
            let expectation = XCTestExpectation(description: "Login request should fail")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
        }
            // Act
        sut.btnLogin.sendActions(for: .touchUpInside)
            
            // Wait for the expectation to be fulfilled
            wait(for: [expectation], timeout: 5) // Adjust the timeout as needed
        let topVC = mockNavigation.pushedViewController as? HomeVC
        topVC?.loadViewIfNeeded()
        XCTAssertNotNil(topVC)
        XCTAssertNotNil(topVC?.profile, "User Profile object should not be nil")
        }
    
    func test_loginVC_loginRequestFailed() {
        // Arrange
        let sut = makeSUT()
        let mockNavigation = MockNavigationController(rootViewController: sut)
        let router = LoginRouter(navigationController: mockNavigation)
        sut.router = router
        let expectation = XCTestExpectation(description: "Login request should fail")
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        expectation.fulfill()
    }
        // Act
    sut.btnLogin.sendActions(for: .touchUpInside)
        
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 5) // Adjust the timeout as needed
    let topVC = mockNavigation.presentViewController as? UIAlertController
    topVC?.loadViewIfNeeded()
    XCTAssertNotNil(topVC)
        let expectedResult = "User not found"
        let actualError = topVC?.message
        XCTAssertEqual(expectedResult, actualError)
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> LoginVC {
        let viewModel = LoginViewModel(service: LoginAPIClientStub())
        let view = LoginUIComposer.createLoginModule(viewModel)
        view.loadViewIfNeeded()
        return view
    }

}
