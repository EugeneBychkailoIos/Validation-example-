//
//  ValidationEmptyError.swift
//
//  Created by jekster on 9/6/21.
//

import Foundation

struct ValidationEmptyError: LocalizedError {
    
    // MARK: - Public properties
    
    var errorDescription: String? {
        return error
    }
    
    // MARK: - Private properties
    
    private let error: String?
    
    // MARK: - Init
    
    init(error: String?) {
        self.error = error
    }
}
