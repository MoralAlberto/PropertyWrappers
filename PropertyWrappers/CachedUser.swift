//
//  CachedUser.swift
//  PropertyWrappers
//
//  Created by Alberto Moral on 21/07/2019.
//  Copyright © 2019 Alberto Moral. All rights reserved.
//

import Foundation

struct CachedUser {
    @Cache(seconds: 2)
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
