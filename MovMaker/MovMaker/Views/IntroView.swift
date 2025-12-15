//
//  WellcomeView.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 24/11/25.
//

import SwiftUI
import AVKit

struct IntroView: View {
    @Environment(\.dismiss) private var dismiss

    let page: Page
    let user: User
    
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
                    if let videoID = page.video {
                        VideoView(videoID: videoID)
                            .frame(height: 300)
                            .padding()
                        
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
                    .foregroundColor(.blue)
                    .padding(.leading, 30)
                    .font(.title)
                    
                Text(page.content ?? "No content")
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .foregroundColor(.blue)
                    .padding(.leading, 30)
                    .padding(.top, 10)
                
                Spacer()
                
                Button {
                    setProgress()
                }
            label: {
//                            RoundedRectangle(cornerRadius: 8)
//                                .background(Color.gray)
//                                .foregroundColor(.white)
//                                .overlay {
//                                    Text("Entrar")
//                                        .foregroundColor(.white)
//                                }
                    
                    Text("Começar Módulo")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.blue)
                        }
                    
                }
                .padding()
                .disabled(user.progress >= (page.id - 1))
                
            }
        }
    }
    
    func setProgress() {
        user.progress += 1
        dismiss()
    }
}



