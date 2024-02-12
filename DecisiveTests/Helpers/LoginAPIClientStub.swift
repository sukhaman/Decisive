//
//  Created by Sukhaman Singh on 2/11/24.
//

import Foundation
import Combine
import Decisive

class LoginAPIClientStub: LoginAPIClient {
    func sendLoginRequest(from request: URLRequest) -> AnyPublisher<Data, Error> {
        guard let url = request.url else {
                    return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
                }
                
                // Check if the request HTTP method is GET
                guard request.httpMethod == "POST" else {
                    return Fail(error: URLError(.unsupportedURL)).eraseToAnyPublisher()
                }
                
                // Return a publisher with some mock data
                let mockData = Data("Mock response data".utf8)
                return Just(mockData)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            }
}
