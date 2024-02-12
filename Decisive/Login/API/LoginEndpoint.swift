//
//  Created by Sukhaman Singh on 2/11/24.
//

import Foundation

protocol APIProtocol {
    static var baseUrl: URL {get}
    
}
enum LoginEndpoint: RawRepresentable,APIProtocol {
    init?(rawValue: String) { nil }
    
    static let baseUrl = URL(string: "valid.baseurl.com")!
    case login
    
    var rawValue: String {
        switch self {
            case .login: return "api/v1/login/"
        }
    }
}

extension RawRepresentable where RawValue == String, Self: APIProtocol {
    var url: URL { Self.baseUrl.appendingPathComponent(rawValue, conformingTo: .data)}
}
