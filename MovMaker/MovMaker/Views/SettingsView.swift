//
//  SettingsView.swift
//  MovMakerTeste
//
//  Created by Nixson Pires on 01/12/25.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @State private var dailyReminder: Bool = true
    @State private var darkMode: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    
                    Text("Configurações")
                        .font(.title)
                        .bold()
                    
                    VStack(spacing: 10) {
                        Circle()
                            .frame(width: 80)
                            .foregroundColor(.gray.opacity(0.3))
                        
                        HStack(spacing: 5) {
                            Text("Olá, Nome!")
                                .font(.headline)
                            Image(systemName: "pencil")
                        }
                        
                        Divider()
                            .frame(height: 2)
                            .background(Color.blue)
                            .padding(.horizontal)
                        
                        Text("Seu progresso em 21 dias")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Preferências")
                            .font(.headline)
                        
                        preferenceRow(
                            icon: "bell",
                            title: "Lembretes Diários",
                            toggle: $dailyReminder
                        )
                        
                        preferenceRow(
                            icon: "moon",
                            title: "Modo Noturno",
                            toggle: $darkMode
                        )
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Informações")
                            .font(.headline)
                        
                        infoRow(icon: "info.circle", title: "Sobre o App")
                        infoRow(icon: "lock.shield", title: "Política de Privacidade")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Área Parental")
                            .font(.headline)
                        
                        infoRow(icon: "person.2.fill", title: "Área dos Pais")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                }
                .padding(.vertical)
            }
        }
    }
    
    func preferenceRow(icon: String, title: String, toggle: Binding<Bool>) -> some View {
        HStack {
            Image(systemName: icon)
            Text(title)
            Spacer()
            Toggle("", isOn: toggle)
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
    }
    
    func infoRow(icon: String, title: String) -> some View {
        HStack {
            Image(systemName: icon)
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}

#Preview {
    SettingsView()
}
