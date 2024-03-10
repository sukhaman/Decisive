//
//  AuthenticationViewModel.swift
//  Decisive
//
//  Created by Sukhaman Singh on 3/9/24.
//

import Foundation
import Combine

class AuthenticationViewModel {
    private var service: AuthenticationAPIService
    @Published var errorMessage: String?
    @Published var userProfile: UserProfile?
    init(service: AuthenticationAPIService) {
        self.service = service
    }
    
    func checkTokenValidity() {
        self.errorMessage = nil
        self.service
    }
}

class AuthenticationAPIService {
    
    func fetchData(from request: URLRequest) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .mapError({ error in
                return error
             })
            .tryMap({ data, response in
                guard let httpResponse =  response as? HTTPURLResponse, (200...299)
                    .contains(httpResponse.statusCode) else {
                    let json = try? JSONSerialization.jsonObject(with: data)
                    print("JSON",json)
                    throw URLError(URLError.badServerResponse)
                }
                return data
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
