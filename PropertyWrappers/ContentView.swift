//
//  ContentView.swift
//  PropertyWrappers
//
//  Created by Alberto Moral on 18/07/2019.
//  Copyright © 2019 Alberto Moral. All rights reserved.
//

import SwiftUI
import Foundation

struct ContentView : View {
    var cachedUser = CachedUser(name: "Alberto")
    var userForm = UserForm(name: "Alberto")
    
    var body: some View {
        VStack {
            Text("Property Wrapper Example")
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
