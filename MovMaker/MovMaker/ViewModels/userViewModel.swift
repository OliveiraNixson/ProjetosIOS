//
//  userViewModel.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 06/12/25.
//

import Foundation
import SwiftData

class UserViewModel: ObservableObject {
    
    static var shared: UserViewModel = UserViewModel()
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String?
    @Published var age:Int = 10
    @Published var loggedInUser: User?  = nil
    @Published var errorMessage: String?
    @Published var users: [User] = []
    
    private init() {}

    func login(context: ModelContext){
        
        
        guard !email.isEmpty else {
            errorMessage = "Email não pode estar vázio."
            return
        }
        guard !password.isEmpty else{
            errorMessage = "Senha não pode estar vázia."
            return
        }
        
        let descriptor = FetchDescriptor<User>(
            predicate: #Predicate<User>{$0.email == email}
        )
        
        do {
            if let user = try context.fetch(descriptor).first{
                if user.password == password {
                    loggedInUser = user
                    errorMessage = ""
                                
                } else {
                    errorMessage = "Senha incorreta."
                    }

                } else {
                errorMessage = "Nenhum usuário encontrado com esse email."
            }
        }catch{
            errorMessage = "Usuário não encontrado."
        }
        
    }
    
    func register(context: ModelContext){
        
        guard !name.isEmpty else{
            errorMessage = "Nome não pode estar vázio."
            return
        }
        guard !email.isEmpty else{
            errorMessage = "Email não pode estar vázio."
            return
        }
        guard !password.isEmpty else{
            errorMessage = "Senha não pode estar vázia."
            return
        }
        guard password == confirmPassword else{
            errorMessage = "Senhas não são iguais."
            return
        }
        
        let newUser = User(name: name, email: email, age: age, password: password)
        
        context.insert(newUser)
        
        do {
           try context.save()
        } catch{
            errorMessage = "Erro ao Salvar"
            return
        }
        
        fetchUser(context: context)
    }
    
    func fetchUser (context: ModelContext)
    {
        
        let descriptor  = FetchDescriptor<User>()
        
        do {
            users = try context.fetch(descriptor)
        }catch{
            fatalError("Não foi achado nenhuma tarefa salva.")
        }
        
        
    }
    
    func logout(){
        
    }
    
    func getUser(){
        
    }
    
    static func getShared() -> UserViewModel {
        return shared
    }
}
