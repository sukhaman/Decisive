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
    case invalidEmail
    var errorDescription: String? {
        switch self {
        case .invalidFirstName:
            return "Invalid First Name"
        case .invalidLastName:
            return "Invalid Last Name"
        case .invalidPhoneNumber:
            return "Invalid Phone Number"
        case .invalidEmail:
            return "Invalid Email"
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
}
