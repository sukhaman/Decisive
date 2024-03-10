//
//  RegistrationViewModel.swift
//  Decisive
//
//  Created by Sukhaman Singh on 3/6/24.
//

import Foundation
//
//  Created by Sukhaman Singh on 2/12/24.
//

import Foundation
import Combine
class RegistrationViewModel {
    private var service: RegistrationAPIService
    private var cancellables: Set<AnyCancellable> = []
    @Published var errorMessage: String?
    @Published var userProfileData: LoginUserProfile?
    init(service: RegistrationAPIService) {
        self.service = service
    }
    
    func registration(user: UserProfile) {
    
        var request = URLRequest(url: LoginEndpoint.registration.url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [ "Content-Type": "application/json", "Accept": "application/json",]
        request.httpBody = try? JSONEncoder().encode(user)
        let publisher = service.sendLoginRequest(from: request)
        publisher
            .sink { completion in
                switch completion {
                    
                case .finished:
                    break
                case .failure(let error as NSError):
                    print("Error", error)
                    let userInfo = error.userInfo as [String: Any]
                        // Access specific keys in the user info dictionary
                        if let value = userInfo["error"] as? String {
                            // Do something with the value
                            self.errorMessage = value
                        }
                    
                    
                }
            } receiveValue: { [weak self] profile in
                self?.userProfileData = profile
                print("User created",profile)
                
            }
            .store(in: &cancellables)

    }
}


class RegistrationAPIService: LoginAPIClient {
    func allUsers(from request: URLRequest) -> AnyPublisher<Data, Error> {
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
    
    func sendLoginRequest(from request: URLRequest) -> AnyPublisher<LoginUserProfile?, Error> {
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
                return try? JSONDecoder().decode(LoginUserProfile.self, from: data)
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
        
}
