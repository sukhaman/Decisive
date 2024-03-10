//
//  Created by Sukhaman Singh on 3/2/24.
//

import Foundation

enum HomeAPIEndpoint: RawRepresentable,APIProtocol {
    init?(rawValue: String) { nil }
    
    static internal let baseUrl = URL(string: "https://moviesdatabase.p.rapidapi.com/")!
    case titles
    
    var rawValue: String {
        switch self {
        case .titles: return "titles/"
        }
    }
}
