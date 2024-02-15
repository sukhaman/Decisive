//
//  Created by Sukhaman Singh on 2/12/24.
//

import UIKit

class HomeVC: UIViewController {
    
    private (set) public var profile: UserProfile?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    fileprivate func configureViewController() {
        title = "Home"
    }
    
    convenience init(profile: UserProfile) {
        self.init()
        self.profile = profile
    }
}
