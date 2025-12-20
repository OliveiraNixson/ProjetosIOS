//
//  LoginView2.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 13/12/25.
//

import SwiftUI
import SwiftData


struct LoginView2: View {
    @Environment(\.modelContext) private var context
    @StateObject private var userVM = UserViewModel2()

    

    var body: some View {
        NavigationStack {

            if let user = userVM.loggedInUser {
                HomeView(user: user)
            } else {
                VStack(spacing: 50) {

                    VStack(alignment: .center, spacing: 50) {

                        VStack(alignment: .center) {
                            Text("Login")
                                .font(.title)
                                .bold()
                                .padding(.horizontal)

                            Divider()
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                        }

                        VStack {
                            Text("Email")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title2)
                                .bold()
                                .padding(.horizontal)
                            
                            
                            TextField("Seu Endereço de email", text: $userVM.email)
                                .padding()
                                .textInputAutocapitalization(.never)
                                .keyboardType(.emailAddress)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(
                                            Color.gray.opacity(0.6),
                                            lineWidth: 1
                                        )
                                )
                                .padding(.horizontal)
                            
                            Text("Senha")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title2)
                                .bold()
                                .padding(.horizontal)
                            SecureField("Sua senha", text: $userVM.password)
                                .padding()
                                .textInputAutocapitalization(.never)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(
                                            Color.gray.opacity(0.6),
                                            lineWidth: 1
                                        )
                                )
                                .padding(.horizontal)
                        }
                        
                        Button {
                            userVM.fakeLogin(contexto: context)
                        } label: {
                            
                            Text("Entrar")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(Color(
                                            red: 0.95,
                                            green: 0.7,
                                            blue: 0.1
                                        ))
                                }
                            
                        }
                        .padding(.horizontal)

                    }

                   

                    NavigationLink("Criar Conta") {
                        RegistrationView(user: userVM )
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(
                                red: 0.95,
                                green: 0.7,
                                blue: 0.1
                            ), lineWidth: 3)
                    )
                    .padding(.horizontal, 20)
                }

            }
        }
    }
}
#Preview {
    LoginView2()
        .modelContainer(for:User.self, inMemory: true)
}
