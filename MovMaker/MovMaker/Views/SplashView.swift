//
//  SplashView.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 20/12/25.
//

import SwiftUI
import Foundation

struct SplashView : View{
    @State private var scale = 0.8
    @State private var opacity = 0.0
    
    var body : some View{
        VStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .scaleEffect(scale)
                .opacity(opacity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear{
            withAnimation(.easeInOut(duration: 1)){
                scale = 1.0
                opacity = 1.0
            }
        }
        
    }
}

#Preview{
    SplashView()
}
