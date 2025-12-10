//
//  WellcomeView.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 24/11/25.
//

import SwiftUI
import AVKit

struct IntroView: View {
    let page: Page
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Seja Bem-Vindo!")
                    .font(.title)
                    .bold()
                
                Divider()
                    .frame(height: 1)
                    .background(Color.gray)
                    .padding(.horizontal)
                
                Group {
                    if false {
                        
                    } else {
                        ZStack{
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 300)
                                .cornerRadius(10)
                            
                            Image(systemName: "play")
                                .font(.title)
                                .background(.black)
                                .foregroundColor(.white)
                                .padding(10)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 30)
                
                Text(page.title ?? "No Title")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                    .font(.title)
                    .bold()
                Text(page.content ?? "No content")
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.leading, 30)
                    .padding(.top, 10)
                
                Spacer()
                
                Button(action: start) {
                    Text("Começar Módulo")
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
    
    func start() {
        UserViewModel.shared.loggedInUser!.progress += 1
    }
}



