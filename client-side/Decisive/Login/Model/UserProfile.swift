//
//  Created by Sukhaman Singh on 2/11/24.
//

import Foundation

public struct UserProfile: Decodable, Encodable {
    var id: Int?
    var firstName: String
    var lastName: String
    var phone: Int
    var email: String
    var password: String?
    
    enum CodingKeys: String,CodingKey {
        case id, phone, email, password
        case firstName = "first_name"
        case lastName = "last_name"
    }
}

public struct LoginUserProfile: Decodable {
    var user: UserProfile?
    var token: String
}
