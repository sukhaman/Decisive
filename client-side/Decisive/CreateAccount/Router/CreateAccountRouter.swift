//
//  Created by Sukhaman Singh on 3/10/24.
//

import UIKit

final class CreateAccountRouter {
    private var navigationController: UINavigationController
    var Action = UIAlertAction.self
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showAlert(_ title: String? = "Error", _ message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = Action.makeActionWithTitle(title: "OK", style: .default) { _ in
            
        }
        alertController.addAction(okAction)
        self.navigationController.present(alertController, animated: true)
    }
}
