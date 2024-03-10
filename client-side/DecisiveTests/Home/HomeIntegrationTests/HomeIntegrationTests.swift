//
//  Created by Sukhaman Singh on 2/14/24.
//

import XCTest
@testable import Decisive

class HomeIntegrationTests: XCTestCase {
    
    func test_homeVC_hasTitle() {
        let sut = makeSUT()
        XCTAssertEqual(sut.title, "Home")
    }
    
    // MARK: Helpers
    
    fileprivate func makeSUT() -> HomeVC {
        let view = HomeVC(profile: makeUserProfile())
        view.loadViewIfNeeded()
        return view
    }
    
    private func makeUserProfile() -> UserProfile {
        return try! JSONDecoder().decode(UserProfile.self, from: makeUserProfiledData())
    }
    
    private func makeUserProfiledData() -> Data {
        return try! JSONSerialization.data(withJSONObject:
                                                                ["id": 2, "first_name": "First","last_name": "Last"
                                                           ])
    }
}

