//
//  Created by Sukhaman Singh on 2/11/24.
//

import Foundation

protocol APIProtocol {
    static var baseUrl: URL {get}
    
}
enum LoginEndpoint: RawRepresentable,APIProtocol {
    init?(rawValue: String) { nil }
    
    static internal let baseUrl = URL(string: "http://localhost:8000/")!
    case login
    case registration
    case allUsers
    var rawValue: String {
        switch self {
            case .login: return "api/v1/login/"
        case .registration: return "api/v1/registration/"
        case .allUsers: return "api/v1/users/"
        }
    }
}

extension RawRepresentable where RawValue == String, Self: APIProtocol {
    var url: URL { Self.baseUrl.appendingPathComponent(rawValue, conformingTo: .data)}
}
