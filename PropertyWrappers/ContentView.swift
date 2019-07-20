//
//  ContentView.swift
//  PropertyWrappers
//
//  Created by Alberto Moral on 18/07/2019.
//  Copyright © 2019 Alberto Moral. All rights reserved.
//

import SwiftUI
import Foundation

struct CachedUser {
    @Cache(seconds: 2)
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

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

struct ContentView : View {
    var cachedUser = CachedUser(name: "Alberto")
    var userForm = UserForm(name: "Alberto")
    
    var body: some View {
        VStack {
            Text("Hello World")
            Button(action: {
                self.printCachedValue()
                self.printCachedValueAfter3Seconds()
                self.printValidation()
            }) {
                Text("Tap Me Now")
            }
        }
    }
    
    private func printValidation() {
        switch userForm.validate {
        case .success:
            print("Success")
        case .failure(let error):
            print("Error \(error)")
        }
    }
    
    private func printCachedValue() {
        print("Name: \(String(describing: self.cachedUser.name))")
    }
    
    private func printCachedValueAfter3Seconds() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            print("Name after 3 seconds: \(String(describing: self.cachedUser.name))")
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
