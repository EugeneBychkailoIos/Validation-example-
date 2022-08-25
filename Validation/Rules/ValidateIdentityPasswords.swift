//
//  ValidateIdentityPasswords.swift
//
//  Created by jekster on 9/30/21.
//

import Foundation

struct ValidateIdentityPasswords: ValidationPasswordsRule {
    
    func validate(_ input: String?, input2: String?) -> Error? {
        guard let input = input?.trimmingCharacters(in: .whitespaces) else {
            assertionFailure("input must be not nil")
            return ValidationEmptyError(error: nil)
        }
        guard let input2 = input2?.trimmingCharacters(in: .whitespaces) else {
            assertionFailure("input must be not nil")
            return ValidationEmptyError(error: nil)
        }
        guard input == input2 else {
            return ValidateIdentityPasswords.ValidationError()
        }
        return nil
    }
        
    // MARK: Nested Types
    
    struct ValidationError: LocalizedError {
        var errorDescription: String? {
            return Strings.Screen.Profile.Settings.ChangePassword.InvalidPassword.title
        }
    }
}

protocol ValidationPasswordsRule {
    
    /// Method that validate string
    /// If error is nil, string is valid
    func validate(_ input: String?, input2: String?) -> Error?
    
}
