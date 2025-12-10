//
//  UserView.swift
//  MovMakerTeste
//
//  Created by Nixson Pires on 01/12/25.
//

import Foundation
import SwiftUI

struct UserView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    
                    
                    Text("Sobre o App")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                    
                    VStack(spacing: 10) {
                        Circle()
                            .frame(width: 150)
                            .foregroundColor(.gray.opacity(0.3))
                        
                        Text("Nome")
                            .font(.title2)
                            .bold()
                        
                        Text("Versão: 1.0.0")
                            .foregroundColor(.gray)
                    }
                    
                    VStack(spacing: 0) {
                        infoRow("Termos de Uso")
                        infoRow("Política de Privacidade")
                        infoRow("Licenças")
                        infoRow("Contato")
                    }
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    Text(Date.now.formatted(date: .long, time: .shortened))
                        .foregroundColor(.gray)
                        .padding(.bottom, 40)
                }
            }
        }
    }
    
    func infoRow(_ title: String) -> some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            
            Divider()
        }
    }
}

#Preview {
    UserView()
}
