//
//  LoginViewModel.swift
//  Decisive
//
//  Created by Sukhaman Singh on 2/12/24.
//

import Foundation
import Combine
class LoginViewModel {
    private var service: LoginAPIClient
    private var cancellables: Set<AnyCancellable> = []
    @Published var errorMessage: String?
    @Published var userProfileData: UserProfile?
    init(service: LoginAPIClient) {
        self.service = service
    }
    
    func fetchUserProfile() {
        var request = URLRequest(url: LoginEndpoint.login.url)
        request.httpMethod = "POST"
        let publisher = service.sendLoginRequest(from: request)
        publisher
            .sink { completion in
                switch completion {
                    
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] profile in
                self?.userProfileData = profile
            }
            .store(in: &cancellables)

    }
}


class LoginAPIService: LoginAPIClient {
    func sendLoginRequest(from request: URLRequest) -> AnyPublisher<UserProfile?, Error> {
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
                return try? JSONDecoder().decode(UserProfile.self, from: data)
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
        
}
