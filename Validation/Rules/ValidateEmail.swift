//
//  ValidateEmail.swift
//
//  Created by jekster on 9/6/21.
//

import Foundation

struct ValidateEmail: ValidationRule {
    
    // MARK: Public methods
    
    func validate(_ input: String?) -> Error? {
        guard let input = input?.trimmingCharacters(in: .whitespaces),
              !input.isEmpty else {
            return ValidationEmptyError(error: Strings.Screen.Error.Validation.Empty.Email.title)
        }
        guard let regex = try? NSRegularExpression(pattern: regex) else {
            return ValidationErrorInvalidPattern()
        }
        guard regex.matches(input) else {
           return ValidateEmail.ValidationError()
        }
        return nil
    }
    
    // MARK: Private properties
    
    var regex: String {
        "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    }
    
    // MARK: Nested Types
    
    struct ValidationError: LocalizedError {
        var errorDescription: String? {
            return Strings.Screen.Error.Validation.Invalid.Email.title
        }
    }
}
