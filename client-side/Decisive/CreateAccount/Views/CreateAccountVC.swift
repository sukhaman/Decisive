//
//  Created by Sukhaman Singh on 2/25/24.
//

import UIKit

class CreateAccountVC: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()
    let firstNameView = CustomLabelTextFieldView(CreateAccountConstant().firstName,CreateAccountConstant().firstNamePlacholder)
    let lastNameView = CustomLabelTextFieldView(CreateAccountConstant().lastName, CreateAccountConstant().lastNamePlacholder)
    var emailView = CustomLabelTextFieldView(CreateAccountConstant().email, CreateAccountConstant().emailPlacholder)
    var phoneView = CustomLabelTextFieldView(CreateAccountConstant().phone, CreateAccountConstant().phonePlacholder)
    var passwordView = CustomLabelTextFieldView(CreateAccountConstant().password, CreateAccountConstant().passwordPlacholder)
    var confirmPasswordView = CustomLabelTextFieldView(CreateAccountConstant().confirmPassword, CreateAccountConstant().confirmPasswordPlacholder)
    var btnCreate = CustomButton(backgroundColor: .appDarkBluePrimary, title: CreateAccountConstant().createAccount)
    var viewModel = RegistrationViewModel(service: RegistrationAPIService())
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
        addButtonView()
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
            confirmPasswordView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    fileprivate func addButtonView() {
        contentView.addSubview(btnCreate)
        // Auto Layout constraints
        NSLayoutConstraint.activate([
            btnCreate.topAnchor.constraint(equalTo: confirmPasswordView.bottomAnchor, constant: 20),
            btnCreate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            btnCreate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            btnCreate.heightAnchor.constraint(equalToConstant: 45),
            contentView.bottomAnchor.constraint(equalTo: btnCreate.bottomAnchor, constant: 30)
        ])
        
        btnCreate.addTarget(self, action: #selector(buttonCreateAccountTapped(_:)), for: .touchUpInside)
    }
    
    @objc func buttonCreateAccountTapped(_ sender: UIButton) {
        self.viewModel.registration(user: UserProfile(firstName: "John", lastName: "Resse", phone: 1239987666, email: "good@test.com",password: "test@1234"))
    }
}
