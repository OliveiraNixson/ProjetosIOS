//
//  ContentView_3.swift
//  IExpense
//
//  Created by Nixson Pires on 24/09/25.
//

import Foundation
import SwiftUI

struct ContentView_3: View{
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View{
        VStack{
            List{
                ForEach(numbers, id:\.self){
                    Text("Row \($0)")
                }
                .onDelete(perform: removeRows)
            }
            Button("Add Number"){
                numbers.append(currentNumber)
                currentNumber += 1
            }
            
            
        }.toolbar{
           
        }
    }
    
    
    func removeRows(at offsets: IndexSet){
        numbers.remove(atOffsets: offsets)
    }
}


#Preview {
    ContentView_3().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
