//
//  Created by Sukhaman Singh on 2/12/24.
//

import UIKit

class HomeVC: UIViewController {
    
    private var profile: UserProfile?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    convenience init(profile: UserProfile) {
        self.init()
        self.profile = profile
    }
}
