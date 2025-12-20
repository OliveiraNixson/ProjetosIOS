//
//  OnBoardingView.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 20/12/25.
//

import SwiftUI

struct OnBoardingView: View {

    @AppStorage("hasSeenBoarding") private var hasSeenOnBoarding = false
    @State private var currentPage = 0

    let pages: [OnboardingPage]

    var body: some View {
        TabView(selection: $currentPage) {

            ForEach(Array(pages.enumerated()), id: \.offset) { index, page in
                VStack(spacing: 20) {

                    Image(page.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)

                    Text(page.title)
                        .font(.title)
                        .bold()

                    Text(page.description)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)

                    Button {
                        if currentPage < pages.count - 1 {
                            currentPage += 1
                        } else {
                            hasSeenOnBoarding = true
                        }
                    } label: {
                        Text(currentPage == pages.count - 1 ? "Começar" : "Avançar")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 100)
                                    .foregroundStyle(Color(
                                        red: 0.95,
                                        green: 0.7,
                                        blue: 0.1
                                    ))
                            }
                    }
                    .padding(.horizontal, 20)
                }
                .tag(index)
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    let pages: [OnboardingPage] = Bundle.main.decode("onBoardingPages.json")
    return OnBoardingView( pages : pages)
}


