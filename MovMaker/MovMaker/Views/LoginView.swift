
//
//  LoginView.swift
//  MovMakerTeste
//
//  Created by Nixson Pires on 01/12/25.
//

//
//  LoginView.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 24/11/25.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @Environment(\.modelContext) var contexto
    @StateObject var user: UserViewModel
    
    
    init() {
        _user = StateObject(wrappedValue: UserViewModel.shared)
        }
    
    var body: some View {
        NavigationStack{
            
            if let _ = user.loggedUser{
                
            }else{
                VStack(spacing: 50) {
                    
                    VStack(alignment: .leading, spacing: 50) {
                        
                        VStack(alignment: .leading) {
                            Text("Bem Vindo!")
                                .font(.largeTitle)
                                .bold()
                                .padding(.horizontal)
                            
                            Divider()
                                .frame(width: 250, height: 2)
                                .padding(.horizontal)
                        }
                        
                        VStack {
                            TextField("Email", text: $user.email)
                                .padding()
                                .textInputAutocapitalization(.never)
                                .keyboardType(.emailAddress)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                                )
                                .padding(.horizontal)
                            
                            SecureField("Senha", text: $user.password)
                                .padding()
                                .textInputAutocapitalization(.never)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                                )
                                .padding(.horizontal)
                        }
                        
                        Button{
                            user.loggedUser = User(
                            name: "Default",
                            email: "Default@Email",
                            age: 99,
                            password: "PASS"
                                
                            )
                            } label: {
                                Text("Entrar")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background {
                                                RoundedRectangle(cornerRadius: 8)
                                                    .foregroundStyle(Color.gray)
                                                                }                  
                            }
                            .padding()
                        
                        
                    }
                    
                    Button("Google") {
                        login()
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )     
                    .padding(.horizontal, 20)
                    
                    
                    NavigationLink("Criar Conta") {
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(.horizontal, 20)
                }
            }
        }
    }
    
    func login() {
        // lógica futura
    }
}


