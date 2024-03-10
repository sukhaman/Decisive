//
//  Created by Sukhaman Singh on 2/11/24.
//

import UIKit
import Combine

class LoginVC: UIViewController {
    var backgroundAvatar = UIImageView(frame: .zero)
    var loginView = UIView()
    var appLogoAvatar = UIImageView(frame: .zero)
    var txtEmail = CustomTextField(placeholder: "Email")
    var txtPassword = CustomTextField(placeholder: "Password")
    var btnLogin = CustomButton(backgroundColor: .appOrangePrimary, title: "Sign In")
    var btnSignup = CustomButton(backgroundColor: .clear, title: "Create Account",titleColor: .appDarkBluePrimary)
    var viewModel: LoginViewModel? {
        didSet {
            bindServerResponse()
        }
    }
    var router: LoginRouter?
    private var cancellables: Set<AnyCancellable> = []
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.addBackgroundImageView()
        self.addLoginView()
        addAppLogoAvatarView()
        addEmailTextField()
        addPasswordTextField()
        addSignInButton()
        addSignUpButton()
        if let navigationController = self.navigationController {
            self.router = LoginRouter(navigationController: navigationController)
        }
    }
    
   fileprivate func addBackgroundImageView() {
        self.view.addSubview(self.backgroundAvatar)
        self.backgroundAvatar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.backgroundAvatar.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.backgroundAvatar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.backgroundAvatar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.backgroundAvatar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        self.backgroundAvatar.image = UIImage(resource: .samaraDoole)
    }
    
   fileprivate func addLoginView() {
        self.view.addSubview(self.loginView)
        self.loginView.backgroundColor = .systemBackground
        self.loginView.translatesAutoresizingMaskIntoConstraints = false
        let width = self.view.frame.size.width * 0.7
        NSLayoutConstraint.activate([
            self.loginView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.loginView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.loginView.widthAnchor.constraint(equalToConstant: width),
            self.loginView.heightAnchor.constraint(equalToConstant: 320)
        ])
       
       self.loginView.layer.shadowPath = UIBezierPath(rect: self.loginView.bounds).cgPath
       self.loginView.layer.shadowColor = UIColor.lightGray.cgColor
       self.loginView.layer.shadowOpacity = 2
       self.loginView.layer.shadowOffset = .zero
       self.loginView.layer.shadowRadius = 5
       self.loginView.layoutSubviews()
       self.loginView.layer.cornerRadius = 10
    }
    
   fileprivate func addAppLogoAvatarView() {
        self.view.addSubview(self.appLogoAvatar)
        self.appLogoAvatar.translatesAutoresizingMaskIntoConstraints = false
        self.appLogoAvatar.image =  UIImage(resource: .appIcon)
        NSLayoutConstraint.activate([
            self.appLogoAvatar.topAnchor.constraint(equalTo: self.loginView.topAnchor, constant: 20),
            self.appLogoAvatar.centerXAnchor.constraint(equalTo: self.loginView.centerXAnchor),
            self.appLogoAvatar.widthAnchor.constraint(equalToConstant: 60),
            self.appLogoAvatar.heightAnchor.constraint(equalToConstant: 60)
        ])
       self.appLogoAvatar.layer.shadowPath = UIBezierPath(rect: self.appLogoAvatar.bounds).cgPath
       self.appLogoAvatar.layer.shadowColor = UIColor.lightGray.cgColor
       self.appLogoAvatar.layer.shadowOpacity = 2
       self.appLogoAvatar.layer.shadowOffset = .zero
       self.appLogoAvatar.layer.shadowRadius = 5
       self.appLogoAvatar.layoutSubviews()
       self.appLogoAvatar.layer.cornerRadius = 10
    }
    
   fileprivate func addEmailTextField() {
        self.loginView.addSubview(txtEmail)
       txtEmail.keyboardType = .emailAddress
        NSLayoutConstraint.activate([
            self.txtEmail.topAnchor.constraint(equalTo: self.appLogoAvatar.bottomAnchor, constant: 20),
            self.txtEmail.leadingAnchor.constraint(equalTo: self.loginView.leadingAnchor, constant: 20),
            self.txtEmail.trailingAnchor.constraint(equalTo: self.loginView.trailingAnchor,constant: -20),
            self.txtEmail.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
   fileprivate func addPasswordTextField() {
        self.loginView.addSubview(txtPassword)
       txtPassword.isSecureTextEntry = true
        NSLayoutConstraint.activate([
            self.txtPassword.topAnchor.constraint(equalTo: self.txtEmail.bottomAnchor, constant: 20),
            self.txtPassword.leadingAnchor.constraint(equalTo: self.loginView.leadingAnchor, constant: 20),
            self.txtPassword.trailingAnchor.constraint(equalTo: self.loginView.trailingAnchor,constant: -20),
            self.txtPassword.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
   fileprivate func addSignInButton() {
        self.loginView.addSubview(btnLogin)
        NSLayoutConstraint.activate([
            self.btnLogin.topAnchor.constraint(equalTo: self.txtPassword.bottomAnchor, constant: 20),
            self.btnLogin.centerXAnchor.constraint(equalTo: self.txtPassword.centerXAnchor),
            self.btnLogin.widthAnchor.constraint(equalToConstant: 120),
            self.btnLogin.heightAnchor.constraint(equalToConstant: 45)
        ])
        btnLogin.layer.cornerRadius = 22.5
       btnLogin.addTarget(self, action: #selector(btnLoginTapped(_:)), for: .touchUpInside)
    }
    
    @objc func btnLoginTapped(_ sender: UIButton) {
        let email = self.txtEmail.text
        let password = self.txtPassword.text
        self.viewModel?.fetchUserProfile(email, password: password)
    }
    
   fileprivate func addSignUpButton() {
        self.loginView.addSubview(btnSignup)
        NSLayoutConstraint.activate([
            self.btnSignup.topAnchor.constraint(equalTo: self.btnLogin.bottomAnchor, constant: 10),
            self.btnSignup.leadingAnchor.constraint(equalTo: self.loginView.leadingAnchor, constant: 20),
            self.btnSignup.trailingAnchor.constraint(equalTo: self.loginView.trailingAnchor,constant: -20),
            self.btnSignup.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    fileprivate func bindServerResponse() {
        self.viewModel?.$errorMessage
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] errorMessage in
                if let self, let errorMessage {
                    self.router?.showAlert(errorMessage)
                }
            })
            .store(in: &cancellables)
        
        self.viewModel?.$userProfileData
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] profile in
                if let self, let profile, let user = profile.user {
                    UserDefaults.standard.setValue(user.id, forKey: "user_id")
                    UserDefaults.standard.setValue(profile.token, forKey: "access_token")
                    let destVC = HomeVC(profile: user)
                    self.show(destVC, sender: nil)
                }
            })
            .store(in: &cancellables)
    }
}

