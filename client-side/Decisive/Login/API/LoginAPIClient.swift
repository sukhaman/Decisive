//
//  Created by Sukhaman Singh on 2/11/24.
//

import Foundation
import Combine

public protocol LoginAPIClient {

    func sendLoginRequest(from request: URLRequest) -> AnyPublisher<LoginUserProfile?,Error>
}
