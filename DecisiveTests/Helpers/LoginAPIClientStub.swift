//
//  Created by Sukhaman Singh on 2/11/24.
//

import Foundation
import Combine
import Decisive

class LoginAPIClientStub: LoginAPIClient {
    func sendLoginRequest(from request: URLRequest) -> AnyPublisher<UserProfile?, Error> {
        guard let url = request.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        // Check if the request HTTP method is GET
        guard request.httpMethod == "POST" else {
            return Fail(error: URLError(.unsupportedURL)).eraseToAnyPublisher()
        }
        
        // Return a publisher with some mock data
        return Just(makeUserProfile())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    private func makeUserProfile() -> UserProfile {
        return try! JSONDecoder().decode(UserProfile.self, from: makeUserProfiledData())
    }
    
    private func makeUserProfiledData() -> Data {
        return try! JSONSerialization.data(withJSONObject: ["user":
                                                                ["id": "2AB2AE66-A4B7-4A16-B374-51BBAC8DB086", "first_name": "First","last_name": "Last"]
                                                           ])
    }
}
