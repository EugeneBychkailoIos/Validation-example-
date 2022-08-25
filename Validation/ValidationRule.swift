//
//  Validation.swift
//
//  Created by jekster on 9/6/21.
//

import UIKit

protocol ValidationRule {
    
    /// Method that validate string
    /// If error is nil, string is valid
    func validate(_ input: String?) -> Error?
    
    /// Regex to validate input string
    var regex: String { get }
}
