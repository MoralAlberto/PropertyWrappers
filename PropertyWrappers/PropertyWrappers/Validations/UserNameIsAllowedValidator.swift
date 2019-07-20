//
//  UserNameIsAllowed.swift
//  PropertyWrappers
//
//  Created by Alberto Moral on 18/07/2019.
//  Copyright © 2019 Alberto Moral. All rights reserved.
//

import Foundation

struct UserNameIsAllowedValidator {
    func execute(name: String?) -> Bool {
        guard let username = name,
            username != "Albert" else { return false }
        return true
    }
}
