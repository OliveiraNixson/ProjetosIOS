//
//  ModuleView.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 10/12/25.
//

import Foundation
import SwiftUI

struct ModuleView: View {
    let module: Module
    let pages: [Page] = Bundle.main.decode("pages.json")
    @Bindable var current_user: User
    var body: some View {
        LazyVStack(alignment: .leading) {
            
            Text("Semana \(module.week)")
                .padding(.horizontal)
                .foregroundColor(.blue)
                .bold()
            
            Text("Módulo 0\(module.week)")
                .padding(.vertical, 10)
                .foregroundColor(.blue)
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color(red: 0.3, green: 0.6, blue: 1.0).opacity(0.5))
                .cornerRadius(5)
                .padding(.horizontal)
            
            
            ForEach(module.days, id: \.self) { day in
                
                if let page = pages.first(where: { $0.id == day }){
                    dayView(day: day, page: page)
                    
                    
                }
            }
        }
    }
    @ViewBuilder
    func dayView(day: Int, page: Page) -> some View {
        
        switch page.type {

        case "intro":
            NavigationLink(destination: IntroView(page: page, user: current_user)) {
                VStack(alignment: .center) {
                    DayComponent(dayNumber: day, progress: current_user.progress)
                    Text("Aula \(day)")
                        .foregroundStyle(.black)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 5)
            }
            .disabled(current_user.progress < (day - 1))

        case "content":
            NavigationLink(destination: ContentPageView(page: page, user: current_user)) {
                VStack(alignment: .center) {
                    DayComponent(dayNumber: day, progress: current_user.progress )
                    Text("Aula \(day)")
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity)
            }
            .disabled(current_user.progress < (day - 1))

        case "activity":
            NavigationLink(destination: ActivityView(page: page, user: current_user)) {
                VStack(alignment: .center) {
                    DayComponent(dayNumber: day, progress: current_user.progress)
                    Text("Aula \(day)")
                        .foregroundColor(.black)
                        .font(.headline)
                }
                .frame(maxWidth: .infinity)
            }
            .disabled(current_user.progress < (day - 1))

        default:
            EmptyView()
        }
    }
}


