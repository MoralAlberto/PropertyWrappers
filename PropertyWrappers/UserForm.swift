//
//  UserForm.swift
//  PropertyWrappers
//
//  Created by Alberto Moral on 21/07/2019.
//  Copyright © 2019 Alberto Moral. All rights reserved.
//

import Foundation

struct User {
    let name: String
}

struct UserForm {
    enum UserError: Error, Equatable {
        case noValidUser
    }
    
    @Validate(initialValue: nil, validations: [UserNameLenghtValidator().execute,
                                               UserNameIsAllowedValidator().execute])
    private var nameField: String?
    
    var validate: Result<User, UserError> {
        guard let name = nameField else {
            return .failure(.noValidUser)
        }
        return .success(.init(name: name))
    }
    
    init(name: String) {
        self.nameField = name
    }
}
