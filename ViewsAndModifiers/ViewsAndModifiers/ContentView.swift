//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by iredefbmac_27 on 30/07/25.
//

import SwiftUI

struct ContentView: View {
    
    let moves = ["\u{270A}", "\u{270B}","\u{270C}"]
    let movesSystems = ["\u{270A}", "\u{270B}","\u{270C}"].shuffled()
    @State private var playerMove = "\u{270A}"
    @State private var systemMove = "\u{270A}"
    @State private var result = ""
    @State private var isShowingScore = false
    
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.white,.yellow],startPoint: .top,endPoint: .bottom)
                .ignoresSafeArea()
            VStack{
                Text("Jokenpo")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                ForEach(0..<1){
                    number in Button{
                        
                    }label:{
                        Text(systemMove)
                            .font(.system(size:150))
                    }
                }
                
                VStack{
                    Picker("Choose your move",selection: $playerMove){
                        ForEach(moves,id:\.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .font(.system(size: 100))
                    .padding()
                    
                }
                Button("Jogar"){
                    play()
                }
                .buttonStyle(.borderedProminent)
                .padding()
                Spacer()
            }
            .alert(result,isPresented: $isShowingScore){
                
            }message: {
                Text("Você \(result)")
            }
        }
    }
    
    func play(){
        systemMove = moves.randomElement()!
        
        if systemMove == playerMove {
            result = "Empate!"
        }else if (playerMove == "✊" && systemMove == "✌️") ||
                    (playerMove == "✋" && systemMove == "✊") ||
                    (playerMove == "✌️" && systemMove == "✋") {
            result = "Ganhou!"
        }else{
            result = "Perdeu!"
        }
        isShowingScore = true
    }
    
}

#Preview {
    ContentView()
}
