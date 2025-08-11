//
//  ContentView.swift
//  WorldScramble
//
//  Created by iredefbmac_27 on 08/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showIngError = false
    @State private var score = 0
    
    var body: some View {
        NavigationStack{
            
            List{
                Section{
                    TextField("Enter your word",text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                Section{
                    ForEach(usedWords, id:\.self){
                        word in
                        HStack{
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
           
            Text("Score: \(score)")
            
            Button("Restart Game"){
                    score = 0
                    startGame()
                }

                .foregroundStyle(.black)
                .background(.blue)
                .cornerRadius(100)
                .padding(10)
            
        }
        
        .onSubmit {
            addNewWord()
        }
        .onAppear(perform: startGame)
        .alert(errorTitle,isPresented: $showIngError){
        
        } message: {
            Text(errorMessage)
        }
    }
    func addNewWord(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else{return }
        
        
        
        
        guard isOriginal(word: answer) else{
            wordError(title: "Word used alredy", message: "Be more original!")
            return
        }
        guard isPssible(word: answer) else{
            wordError(title: "Word not possible", message: "you can't spell that word from '\(rootWord)'!")
            return
        }
        guard isReal(word: answer) else {
            wordError(title: "Word not Recognized", message: "You can't just make them up")
            return
        }
        withAnimation{
            makeScores(value: true)
            usedWords.insert(answer,at:0)
        }
        
        newWord = ""
    }
    func makeScores(value: Bool){
        if value {
            score = score + 1
        }else{
            score = score - 1
        }
    }
    func startGame(){
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            print("Arquivo encontrado em:", startWordURL)
            if let startWords = try? String( contentsOf: startWordURL, encoding: .utf8)
            {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "SilkerRoad"
                print(rootWord)
                
                return
            }
        }
        else{
            fatalError("Could not load start.txt for the game!")
        }
    }
    func isOriginal(word: String )-> Bool {
        !usedWords.contains(word)
    }
    func isPssible(word: String )-> Bool{
        var tempWord = rootWord
        for letter in word{
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at:pos)
            }else{
                
                return false
                
            }
        }
        makeScores(value: true)
        return true
    }
    func isReal(word: String) -> Bool{
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    func wordError(title: String, message: String){
        makeScores(value: false)
        errorTitle = title
        errorMessage = message
        showIngError = true
    }
}

#Preview {
    ContentView()
}
