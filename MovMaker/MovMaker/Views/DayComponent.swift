
//
//  DayComponent.swift
//  MovMaker
//
//  Created by Ian Pacini on 10/12/25.
//

import SwiftUI

struct DayComponent: View {
    var dayNumber: Int
    let progress: Int
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 60)
                .foregroundColor(getButtonStateColor())
            Image(systemName: getButtonStateIcon())
                .foregroundColor(.white)
                .font(.title)
                .bold()
        }
        .padding()
    }
    
    func getButtonStateIcon() -> String {
        let userProgress = progress

        if dayNumber <= userProgress {
            return "checkmark"
        } else  if dayNumber == (userProgress+1){
            return "exclamationmark"
        }else{
            return "lock"
        }
    }
    
    func getButtonStateColor() -> Color {
        let userProgress = progress
        
        if dayNumber <= userProgress {
            return Color(
                red: 0.95,
                green: 0.7,
                blue: 0.1
            )
        } else  if dayNumber == (userProgress + 1) {
            return Color(
                red: 0.95,
                green: 0.7,
                blue: 0.1
            ).opacity(0.7)
        }else{
            return .gray
        }
    }
}
