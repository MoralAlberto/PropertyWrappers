//
//  UserLenght.swift
//  PropertyWrappers
//
//  Created by Alberto Moral on 18/07/2019.
//  Copyright © 2019 Alberto Moral. All rights reserved.
//

import Foundation

struct UserNameLenghtValidator {
    func execute(name: String?) -> Bool {
        guard let username = name,
            username.count > 4 else { return false }
        return true
    }
}
