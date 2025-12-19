//
//  HomeView.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 24/11/25.
//

import Foundation
import SwiftUI

struct HomeView: View {
    let modules: [Module] = Bundle.main.decode("modules.json")
    @Bindable var user: User
    var body: some View {
        ScrollView{
            ForEach(modules){ module in
                ModuleView(module: module,current_user: user)
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Text("Início")
                        .font(.largeTitle)
                        .foregroundStyle(Color(
                            red: 0.95,
                            green: 0.7,
                            blue: 0.1
                        ))
                        .bold()
                    Divider()
                        .frame(maxWidth: .infinity, maxHeight: 10)
                        .padding(.horizontal, 10)
                }
            }
        }
    }
}

