//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by iredefbmac_27 on 28/07/25.
//


















 

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
   @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
   @State  var correctAnswer = Int.random(in:0...2)
    @State private var points = 0
    var body: some View {
        ZStack{
            LinearGradient(colors:[.blue,.black],startPoint: .top,endPoint: .bottom).ignoresSafeArea()
            
            
            VStack(spacing:30){
                Text("Guess the Flag")
                    .foregroundStyle(.white)
                    .font(.largeTitle.weight(.heavy))
                
                VStack {
                    Text("Tap the flag")
                        .foregroundStyle(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                        .font (.largeTitle.weight(.semibold))
                }
                ForEach(0..<3){
                    number in Button{
                        flagTapped(number)
                        countPoints(scoreTitle)
                    }label: {
                        Image(countries[number])
                            .clipShape(.capsule)
                            .shadow(radius: 5)
                            
                    }
                }
            }
            .alert(scoreTitle,isPresented: $showingScore){
                Button("Continue",action: askQuestion)
            } message: {
                Text("your score is \(points)")
            }
        }
        
    }
    func countPoints(_ answer : String){
        if answer == "Correct"{
            points = points + 1
        }else{
            points = points - 1
        }
    }
    
    func flagTapped(_ number : Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
        }else{
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in:0...2)
    }
}

#Preview {
    ContentView()
}
