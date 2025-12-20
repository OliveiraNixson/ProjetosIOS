//
//  MovMakerApp.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 22/11/25.
//

import SwiftUI

@main
struct MovMakerApp: App {
    @State private var showSplash = true
    @AppStorage("hasSeenBoarding") private var hasSeenBoarding = false
    let pages : [OnboardingPage] = Bundle.main.decode("onBoardingPages.json")
    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashView()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            showSplash = false
                        }
                    }
            }else{
                if hasSeenBoarding{
                    ContentView()
                }else{
                    OnBoardingView(pages: pages)
                }
            }
            
            
        }
        .modelContainer(for: User.self)
    }
}
