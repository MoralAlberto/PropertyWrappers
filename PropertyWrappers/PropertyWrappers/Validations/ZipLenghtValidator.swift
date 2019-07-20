//
//  UserLenght.swift
//  PropertyWrappers
//
//  Created by Alberto Moral on 18/07/2019.
//  Copyright © 2019 Alberto Moral. All rights reserved.
//

import Foundation

struct ZipLenghtValidator {
    func execute(zip: String?) -> Bool {
        guard let zip = zip,
            zip.count > 4 else { return false }
        return true
    }
}
