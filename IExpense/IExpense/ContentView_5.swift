//
//  ContentView_5.swift
//  IExpense
//
//  Created by Nixson Pires on 24/09/25.
//

import Foundation
import SwiftUI

struct ContentView_5: View{
    @AppStorage("Tap Count") private var tapCount = 0
    var body: some View{
        
        VStack{
            Button("Tap Count: \(tapCount)"){
                tapCount += 1
            }
        }
    }
}
#Preview {
    ContentView_5().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
