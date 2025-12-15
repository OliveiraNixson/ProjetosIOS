//
//  TaskView.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 24/11/25.
//



import SwiftUI

struct ActivityView: View {
    @Environment(\.dismiss) private var dismiss

    let page: Page
    let user: User
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("Última Aula")
                    .font(.title)
                    .bold()
                
                Divider()
                    .frame(height: 1)
                    .background(Color.gray)
                    .padding(.horizontal)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(maxWidth: .infinity, minHeight: 300)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
                    .padding(.top, 30)
                
                Text("Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e o")
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                
                Spacer()
                
                VStack(spacing: 15) {
                    Button(action: download ) {
                        Text("Baixar Atividade")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                    
                    Button(action: setProgress) {
                        Text("Marcar como Concluído")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue , lineWidth: 3)
                            )
                            .padding(.horizontal)
                    }
                }
                .padding(.bottom, 20)
            }
        }
    }
    
    func setProgress(){
        user.progress += 1
        dismiss()
    }
    func download(){
        
    }
}



