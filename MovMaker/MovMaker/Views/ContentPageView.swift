//
//  ClassView.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 24/11/25.
//

import SwiftUI

struct ContentPageView: View {
    let page: Page
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("Tarefa do dia")
                    .font(.title)
                    .bold()
                
                Divider()
                    .frame(height: 1)
                    .background(Color.gray)
                    .padding(.horizontal)
                
                Spacer()
                
                ZStack {
                    Color.gray.opacity(0.2)
                    
                    VStack(spacing: 10) {
                        Text("Seu desáfio de hoje")
                            .font(.title3)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal,30)
                        
                        Text(page.content ?? "No Content")
                            .padding(.horizontal, 30)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 200)
                .cornerRadius(10)
                .padding(.horizontal, 30)
                
                VStack{
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(maxWidth: .infinity, minHeight: 200)
                        .cornerRadius(10)
                        
                        .padding(.top, 30)
                    
                    Spacer()
                    
                    Text("Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado o")
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 30)
                
                
                Button(action: start) {
                    Text("Marcar Como Concluído")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                .padding(.bottom, 20)
            }
        }
    }
    
    func start() {}
}





