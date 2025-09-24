//
//  ContentView.swift
//  IExpense
//
//  Created by Nixson Pires on 24/09/25.
//

import SwiftUI
import CoreData
import Observation

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
    
}

struct ContentView: View {
    
    @State private var user = User()
    var body: some View {
        VStack{
            Text("Your name is \(user.firstName) \(user.lastName).")

            
            TextField("First Name: ", text:  $user.firstName)
            TextField("First Name: ", text:  $user.lastName)
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
