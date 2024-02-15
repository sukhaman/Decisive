//
//  LoginRouter.swift
//  Decisive
//
//  Created by Sukhaman Singh on 2/13/24.
//

import UIKit

final class LoginRouter {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showAlert(_ message: String) {
        let alertController = UIAlertController (title: "Error", message:message, preferredStyle: .alert)
        let OkAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            
        })
        
        alertController.addAction(OkAction)
        self.navigationController.present(alertController, animated: true , completion: nil)
    }
    
}
