//
//  Created by Sukhaman Singh on 2/11/24.
//

import Foundation

public struct UserProfile: Decodable {
    var id: Int
    var firstName: String
    var lastName: String
    
    enum CodingKeys: String,CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
