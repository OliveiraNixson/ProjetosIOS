//
//  ContentView_4.swift
//  IExpense
//
//  Created by Nixson Pires on 24/09/25.
//

import Foundation
import SwiftUI

struct ContentView_4: View {
    
    @State private var tapCount  = UserDefaults.standard.integer(forKey:"Tap")
    
    var body: some View{
        VStack{
            Button("Tap count: \(tapCount)"){
                tapCount += 1
            }
            
        }
        
    }
}


#Preview {
    ContentView_4().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
