//
//  CacheWrapper.swift
//  PropertyWrappers
//
//  Created by Alberto Moral on 18/07/2019.
//  Copyright © 2019 Alberto Moral. All rights reserved.
//

import Foundation

@propertyWrapper
struct Cache<Value: Comparable> {
    private var seconds: TimeInterval
    private var date: TimeInterval
    
    var value: Value? = nil
    
    var wrappedValue: Value? {
        get {
            if (Date().timeIntervalSince1970 - self.date) > seconds {
                return nil
            } else {
                return value
            }
        }
        set {
            self.date = Date().timeIntervalSince1970
            value = newValue
        }
    }
    
    init(seconds: TimeInterval) {
        self.date = Date().timeIntervalSince1970
        self.seconds = seconds
    }
}
