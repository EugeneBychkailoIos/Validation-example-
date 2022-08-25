//
//  ValidateNumberOrSpecialSymbol.swift
//
//  Created by jekster on 9/6/21.
//

import Foundation

struct ValidateNumberOrSpecialSymbol: ValidationRule {
    
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
           return ValidateNumberOrSpecialSymbol.ValidationError()
        }
        return nil
    }
    
    // MARK: Private properties
    
    var regex: String {
        "(?=.*\\W|\\d)"
    }
    
    // MARK: Nested Types
    
    struct ValidationError: LocalizedError {
        var errorDescription: String? {
            return Strings.Screen.Error.Validation.NumberOrSpecialSymbol.title
        }
    }
}
