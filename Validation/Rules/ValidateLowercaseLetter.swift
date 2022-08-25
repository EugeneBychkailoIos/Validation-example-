//
//  ValidateLowercaseLetter.swift
//
//  Created by jekster on 9/6/21.
//

import Foundation

struct ValidateLowercaseLetter: ValidationRule {
    
    // MARK: Public methods
    
    func validate(_ input: String?) -> Error? {
        guard let input = input?.trimmingCharacters(in: .whitespaces) else {
            assertionFailure("input must be not nil")
            return ValidationEmptyError(error: nil)
        }
        guard let regex = try? NSRegularExpression(pattern: regex) else {
            return ValidationErrorInvalidPattern()
        }
        guard regex.matches(input) else {
           return ValidateLowercaseLetter.ValidationError()
        }
        return nil
    }
    
    // MARK: Private properties
    
    var regex: String {
        "(?=.*[a-z])"
    }
    
    // MARK: Nested Types
    
    struct ValidationError: LocalizedError {
        var errorDescription: String? {
            return Strings.Screen.Error.Validation.LowercaseLetter.title
        }
    }
}
