//
//  AccountCreationValidationService.swift
//  Decisive
//
//  Created by Sukhaman Singh on 3/10/24.
//

import Foundation

enum AccountCreationError: LocalizedError {
    case invalidFirstName
    case invalidLastName
    case invalidPhoneNumber
    case enterValidPhoneNumber
    case invalidEmail
    case enterPassword
    case mismatchPassword
    var errorDescription: String? {
        switch self {
        case .invalidFirstName:
            return "Invalid First Name"
        case .invalidLastName:
            return "Invalid Last Name"
        case .invalidPhoneNumber:
            return "Invalid Phone Number"
        case .enterValidPhoneNumber:
            return "Phone number must be 10 digits"
        case .invalidEmail:
            return "Invalid Email"
        case .enterPassword:
            return "Enter Password"
        case .mismatchPassword:
            return "Password and Confirm Password doesn't match"
        }
    }
}

struct AccountCreationValidationService {
    
    func validateFirstName(_ firstName: String?) throws -> String {
        guard let firstName = firstName else {
            throw AccountCreationError.invalidFirstName
        }
        if firstName.isEmpty {
            throw AccountCreationError.invalidFirstName
        }
        return firstName
    }
    
    func validateLastName(_ lastName: String?) throws -> String {
        guard let lastName = lastName else {
            throw AccountCreationError.invalidLastName
        }
        if lastName.isEmpty {
            throw AccountCreationError.invalidLastName
        }
        return lastName
    }
    
    func validatePhoneNumber(_ phoneNumber: String?) throws -> String {
        guard let phoneNumber = phoneNumber else {
            throw AccountCreationError.invalidPhoneNumber
        }
        if phoneNumber.isEmpty {
            throw AccountCreationError.invalidPhoneNumber
        }
        if phoneNumber.count < 10 {
            throw AccountCreationError.enterValidPhoneNumber
        }
        return phoneNumber
    }
    
    func validateEmail(_ email: String?) throws -> String {
        guard let email = email else {
            throw AccountCreationError.invalidEmail
        }
        if email.isEmpty {
            throw AccountCreationError.invalidEmail
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isEmailValid = emailTest.evaluate(with: email)
        if !isEmailValid {
            throw AccountCreationError.invalidEmail
        }
        return email
    }
    
    func validatePassword(_ password: String?, _ confirmPassword: String?) throws -> String {
        guard let password = password, let confirmPassword = confirmPassword else {
            throw AccountCreationError.enterPassword
        }
        if password.isEmpty {
            throw AccountCreationError.enterPassword
        }
        if password != confirmPassword {
            throw AccountCreationError.mismatchPassword
        }
        return password
    }
}
