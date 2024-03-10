//
//  Created by Sukhaman Singh on 2/12/24.
//

import UIKit


class HomeVC: UIViewController {
    
    private (set) public var profile: UserProfile?
    var viewModel: HomeViewModel? {
        didSet {
            bindServerResponse()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    convenience init(profile: UserProfile) {
        self.init()
        self.profile = profile
    }
    
    fileprivate func bindServerResponse() {
        
    }
    
}
