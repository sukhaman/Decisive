//
//  Created by Sukhaman Singh on 2/28/24.
//

import Foundation

struct CreateAccountConstant {    
    let  firstName: String = localizedString("first_name",comment: "Text for first name view label")
    let  lastName: String = localizedString("last_name",comment: "Text for last name view label")
    let  email: String = localizedString("email",comment: "Text for email view label")
    let  phone: String = localizedString("phone",comment: "Text for phone view label")
    let  password: String = localizedString("password",comment: "Text for password view label")
    let  confirmPassword: String = localizedString("confirm_password",comment: "Text for confirm password view label")
    let  firstNamePlacholder: String = localizedString("first_name_placeholder",comment: "Text for first name view textField")
    let  lastNamePlacholder: String = localizedString("last_name_placeholder",comment: "Text for last name view textField")
    let  emailPlacholder: String = localizedString("email_placeholder",comment: "Text for email view textField")
    let  phonePlacholder: String = localizedString("phone_placeholder",comment: "Text for phone view textField")
    let  passwordPlacholder: String = localizedString("password_placeholder",comment: "Text for password view textField")
    let  confirmPasswordPlacholder: String = localizedString("confirm_password_placeholder",comment: "Text for confirm password view textField")
    let  createAccount: String = localizedString("create_account",comment: "Text for create account button")
    
   private static  func localizedString(_ key: String, comment: String) -> String {
            return NSLocalizedString( key,
                                      tableName: "CreateAccount",
                                      bundle: Bundle(for: CreateAccountVC.self),
                                      comment: comment)
        }
}
