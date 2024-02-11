//
//  Created by Sukhaman Singh on 2/11/24.
//

import Foundation
import Combine

public protocol HTTPClient {

    func fetchData(from request: URLRequest) -> AnyPublisher<Data,Error>
}
