//
//  CacheWrapper.swift
//  PropertyWrappers
//
//  Created by Alberto Moral on 18/07/2019.
//  Copyright © 2019 Alberto Moral. All rights reserved.
//

import Foundation

@propertyWrapper
struct Validate<Value> {
    var value: Value?
    var validations: [(Value?) -> Bool] = []
    
    var wrappedValue: Value? {
        get {
            let passedValidations = validations.reduce(true) { (result, function) in
                return result && function(value)
            }
            guard passedValidations else {
                return nil
            }
            return value
        }
        set {
            value = newValue
        }
    }
    
    init(initialValue value: Value?, validations: [(Value?) -> Bool]) {
        self.value = value
        self.validations = validations
    }
}
