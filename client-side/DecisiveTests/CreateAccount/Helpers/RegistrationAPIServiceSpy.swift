//
//  RegistrationAPIServiceSpy.swift
//  DecisiveTests
//
//  Created by Sukhaman Singh on 3/10/24.
//

import Foundation
import Combine
@testable import Decisive

class RegistrationAPIServiceSpy: RegistrationAPIService {
    
    override func sendLoginRequest(from request: URLRequest) -> AnyPublisher<LoginUserProfile?, any Error> {
        if let requestBody = request.httpBody {
             let user = try? JSONDecoder().decode(UserProfile.self, from: requestBody)
            if user?.email == "any@test.com" {
                let publisher = Result<LoginUserProfile?,Error>.Publisher(.failure(NSError(domain: "Mock Error", code: 12, userInfo: ["error": "Bad Request"])))
                    .eraseToAnyPublisher()
                return publisher
            } else {
                let publisher = Result<LoginUserProfile?,Error>.Publisher(.success(createLoginUserProfile()))
                    .eraseToAnyPublisher()
                return publisher
            }
        } else {
            let publisher = Result<LoginUserProfile?,Error>.Publisher(.success(createLoginUserProfile()))
                .eraseToAnyPublisher()
            return publisher
        }
    }
    
    fileprivate func createLoginUserProfile() -> LoginUserProfile {
        LoginUserProfile(user: UserProfile(firstName: "First", lastName: "Last", phone: 1234567890, email: "email@test.com"), token: "asdhkasdjasSGDASU1238263712")
    }
}
