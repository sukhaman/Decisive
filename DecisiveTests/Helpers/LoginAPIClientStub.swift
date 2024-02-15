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
        
        if let body = request.httpBody {
            let dict = try! JSONSerialization.jsonObject(with: body) as! [String: String]
            let email = dict["email"]! as String
            if email.isEmpty {
                return Fail(error: NSError(domain: "Mock Error", code: 42, userInfo: ["error": "User not found"])).eraseToAnyPublisher()
            } else {
                // Return a publisher with some mock data
                return Just(makeUserProfile())
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            }
        } else {
            return Fail(error: NSError(domain: "Mock Error", code: 42, userInfo: ["error": "User not found"])).eraseToAnyPublisher()
        }
        
    }
    
    private func makeUserProfile() -> UserProfile {
        return try! JSONDecoder().decode(UserProfile.self, from: makeUserProfiledData())
    }
    
    private func makeUserProfiledData() -> Data {
        return try! JSONSerialization.data(withJSONObject:
                                                                ["id": 2, "first_name": "First","last_name": "Last"
                                                           ])
    }
}
