//
//  LoginView.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 24/11/25.
//

import SwiftUI
import SwiftData

struct RegistrationView: View {
    @Environment(\.modelContext) private var context
    
    @StateObject var user: UserViewModel2

    var body: some View {
        VStack(spacing: 100) {
            
            VStack(alignment: .leading, spacing: 50) {
                
                VStack(alignment: .leading) {
                    Text("Registration")
                        .font(.largeTitle)
                        .bold()
                        .padding(.horizontal)
                    
                    Divider()
                        .frame(width: 250, height: 2)
                        .padding(.horizontal)
                }
                
                VStack {
                    TextField("Name", text: $user.name)
                        .padding()
                        .textInputAutocapitalization(.never)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                        )
                        .padding(.horizontal)
                    
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
                    
                    SecureField("Confirme a Senha", text: Binding(
                        get: {user.confirmPassword ?? ""},
                        set:{ user.confirmPassword = $0}
                    )
                    )
                        .padding()
                        .textInputAutocapitalization(.never)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                        )
                        .padding(.horizontal)
                }
                
                NavigationLink(destination: LoginView2()){
                    Button("Registrar") {
                        user.register(context: context)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal)       
                    
                }
            }
                  
        }
    }
    
}



