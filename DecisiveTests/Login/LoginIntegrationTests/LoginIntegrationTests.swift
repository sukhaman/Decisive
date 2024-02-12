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
            let request = URLRequest(url: URL(string: "invalid-url")!)
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
    

    
    // MARK: Helpers
    
    
}
