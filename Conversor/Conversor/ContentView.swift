//
//  ContentView.swift
//  Conversor
//
//  Created by iredefbmac_27 on 22/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var input: Double = 0.0
    @State private var category: String = "Temperature"
    @State private var selectedUnit: String = ""
    @State private var inputCategory: String  = ""
    @State private var inputUnit: String = ""
    @State private var inputValue:Double = 0.0
    
    let units = ["Temperature","Length","Time"]
    let temperatureUnits = ["Kelvin","Celsius","Farenheit"]
    let lengthUnits = ["Meters","Kilometers","Centimeters"]
    let timeUnits = ["Seconds","Minutes","Hours"]
    
    
    var unitChoosed: [String] {
        switch category {
                case "Temperature":
                    return temperatureUnits
                case "Length":
                    return lengthUnits
                case "Time":
                    return timeUnits
                default:
                    return []
                }
    
    }
    
    func calculateCOnversion( value: Double = 0.0,category: String,unit: String)-> Double{
        var output : Double = 0.0
        switch category{
        case "Temperature":
            switch unit{
                case "Kelvin":
                output = value + 273.0
                    return output
                case "Farenheit":
                output = 5.0*(value - 32.0)/9.0
                    return output
                default:
                    return value
            }
        
        case "Length":
            switch unit{
            case "Kilometers":
                output = value / 1000.0
                return output
            case "Centimeters":
                output = value * 100.0
                return output
            default:
                return value
            }
            
        case "Time":
            switch unit{
            case "Seconds":
                output = value*60.0
                return output
            case "Hours":
                output = value/60.0
                return output
            default :
                return value
            }
        default:
            return 0.0
        }
        
    
    }
    
    var body: some View {
        NavigationStack{
            
            Form{
                Section("Category"){
                    TextField("Tap the value",value: $input, format: .number)
                        .keyboardType(.numberPad)
                        
                        
                    Picker("Category",selection : $category){
                        ForEach(units,id:\.self ){
                            
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: category){
                        newValue in selectedUnit = newValue
                        inputValue = input
                        inputCategory = category
                    }
                }
                Section("Units"){
                    Picker("Unit",selection: $selectedUnit ){
                        ForEach(unitChoosed,id:\.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                        .onChange(of: selectedUnit ){
                            inputUnit = selectedUnit
                        }
                }
                
                Section{
                    Text("\(calculateCOnversion(value: inputValue, category: inputCategory, unit: inputUnit), specifier: "%.2f")")
                }
            }.navigationTitle("Conversor")
        }
    }
}

#Preview {
    ContentView()
}
