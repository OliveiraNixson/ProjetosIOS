//
//  ContentView.swift
//  WeSplit
//
//  Created by iredefbmac_27 on 21/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    let tipPercentages = [0,10,15,20]
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople+2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount/100*tipSelection
        let grandTotal = checkAmount+tipValue
        let amountPerPerson = grandTotal/peopleCount
        return amountPerPerson
    }
    var totalValue : Double{
        let amount = Double(checkAmount)
        let tip = Double(tipPercentage)
        let tipValue = checkAmount/100*tip
        let total = tipValue + amount
        return total
    }

    
    var body: some View {
        
        NavigationStack{
            Form{
                Section{
                    TextField("Amount: ",value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD" ))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of People", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) People")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("How much do you want to tip?"){
                    Picker("Percentage",selection:$tipPercentage){
                        ForEach(tipPercentages,id:\.self){
                            Text($0,format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Amount Per Perseon"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                }
                Section("Without Division"){
                    Text(totalValue,format: .currency(code: "USD"))
                }
                
                
            }
            .navigationTitle("WeSplit")
            .toolbar{
                if amountIsFocused {
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
            
        
    }
}

#Preview {
    ContentView()
}
