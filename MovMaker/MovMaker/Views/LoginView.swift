
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
            _user = StateObject(wrappedValue: UserViewModel())
        }
    
    var body: some View {
        NavigationStack{
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
                
                Button("Entrar") {
                    user.login(context: contexto)
                }
                
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.horizontal)
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
                    RegistrationView()
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
    
    func login() {
        // lógica futura
    }
}


struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
