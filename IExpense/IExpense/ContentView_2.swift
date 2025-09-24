//
//  ContentView_2.swift
//  IExpense
//
//  Created by Nixson Pires on 24/09/25.
//

import Foundation
import SwiftUI

struct SecondView: View{
    
    @Environment(\.dismiss) var dismiss
    let name: String
    var body: some View {
        Text("hello, \(name)!")
        Button("Dismiss"){
            dismiss()
        }
    }
}

struct ContentView_2: View {
    
    @State private var showingSheet = false
    var body : some View {
        
        Button("Show Sheet"){
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet, content: {
            SecondView(name:"Nixson")
            
        })
    }
}


#Preview {
    ContentView_2().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
