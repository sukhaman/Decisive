//
//  Created by Sukhaman Singh on 2/25/24.
//

import UIKit

import UIKit

class CreateAccountVC: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()
    let firstNameView = CustomLabelTextFieldView("First Name:", "Enter your first name")
    let lastNameView = CustomLabelTextFieldView("Last Name:", "Enter your last name")
    var emailView = CustomLabelTextFieldView("Email:", "Enter your email")
    var phoneView = CustomLabelTextFieldView("Phone:", "Enter your Phone Number")
    var passwordView = CustomLabelTextFieldView("Password:", "Enter your Password")
    var confirmPasswordView = CustomLabelTextFieldView("Confirm Password:", "Enter your Confirm Password")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addScrollView()
        addContentView()
        addFirstNameView()
        addLastNameView()
        addEmailView()
        addPhoneNumberView()
        addPasswordView()
        addConfirmPasswordView()
    }
    
    fileprivate func addScrollView() {
        // Create a scroll view
        view.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    fileprivate func addContentView() {
        // Create a content view inside the scroll view
        contentView.backgroundColor = .systemBackground
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    

    
    fileprivate func addFirstNameView() {
        contentView.addSubview(firstNameView)
        
        // Auto Layout constraints
        NSLayoutConstraint.activate([
            firstNameView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            firstNameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            firstNameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            firstNameView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    fileprivate func addLastNameView() {
        contentView.addSubview(lastNameView)
        
        // Auto Layout constraints
        NSLayoutConstraint.activate([
            lastNameView.topAnchor.constraint(equalTo: firstNameView.bottomAnchor, constant: 20),
            lastNameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            lastNameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            lastNameView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    fileprivate func addEmailView() {
        contentView.addSubview(emailView)
        
        // Auto Layout constraints
        NSLayoutConstraint.activate([
            emailView.topAnchor.constraint(equalTo: lastNameView.bottomAnchor, constant: 20),
            emailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            emailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            emailView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    fileprivate func addPhoneNumberView() {
        contentView.addSubview(phoneView)
        
        // Auto Layout constraints
        NSLayoutConstraint.activate([
            phoneView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 20),
            phoneView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            phoneView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            phoneView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    fileprivate func addPasswordView() {
        contentView.addSubview(passwordView)
        
        // Auto Layout constraints
        NSLayoutConstraint.activate([
            passwordView.topAnchor.constraint(equalTo: phoneView.bottomAnchor, constant: 20),
            passwordView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            passwordView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            passwordView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    fileprivate func addConfirmPasswordView() {
        contentView.addSubview(confirmPasswordView)
        
        // Auto Layout constraints
        NSLayoutConstraint.activate([
            confirmPasswordView.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 20),
            confirmPasswordView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            confirmPasswordView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            confirmPasswordView.heightAnchor.constraint(equalToConstant: 80),
            contentView.bottomAnchor.constraint(equalTo: confirmPasswordView.bottomAnchor, constant: 30)
        ])
    }
}
