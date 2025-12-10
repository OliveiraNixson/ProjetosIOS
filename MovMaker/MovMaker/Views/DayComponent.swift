//
//  DayComponent.swift
//  MovMaker
//
//  Created by Ian Pacini on 10/12/25.
//

import SwiftUI

struct DayComponent: View {
    var dayNumber: Int
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 80)
                .foregroundColor(getButtonStateColor())
            Image(systemName: getButtonStateIcon())
                .foregroundColor(.white)
                .font(.title)
                .bold()
        }
        .padding()
    }
    
    func getButtonStateIcon() -> String {
        let userProgress = UserViewModel.shared.loggedInUser?.progress ?? 0
        
        if dayNumber <= userProgress {
            return "checkmark"
        } else if dayNumber == (userProgress + 1) {
            return "hourglass"
        } else {
            return "multiply"
        }
    }
    
    func getButtonStateColor() -> Color {
        let userProgress = UserViewModel.shared.loggedInUser?.progress ?? 0
        
        if dayNumber <= userProgress {
            return .green
        } else if dayNumber == (userProgress + 1) {
            return .blue
        } else {
            return .gray
        }
    }
}
