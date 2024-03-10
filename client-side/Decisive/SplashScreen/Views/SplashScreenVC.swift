//
//  Created by Sukhaman Singh on 3/9/24.
//

import UIKit

class SplashScreenVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        checkUserCredentails()
    }
    
    fileprivate func checkUserCredentails() {
        let token = UserDefaults.standard.string(forKey: "access_token")
        token == nil ? showLoginScreen() : showHomeScreen()
    }
    
   fileprivate func showLoginScreen() {
       let destVC = LoginUIComposer.createLoginModule(LoginViewModel(service: LoginAPIService()))
       self.show(destVC, sender: nil)
    }
    
   fileprivate func showHomeScreen() {
       let destVC = HomeVC()
       self.show(destVC, sender: nil)
    }
}
