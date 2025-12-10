//
//  TaskView.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 24/11/25.
//



import SwiftUI

struct ActivityView: View {
    let page: Page
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
                    Button(action: start) {
                        Text("Baixar Atividade")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                    
                    Button(action: start) {
                        Text("Marcar como Concluído")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                }
                .padding(.bottom, 20)
            }
        }
    }
    
    func start() {}
}



