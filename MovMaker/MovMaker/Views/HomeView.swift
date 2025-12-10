//
//  HomeView.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 24/11/25.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State private var range = 0...5
    @StateObject var page : PageViewModel
    
    //let module: [Module] = Bundle.main.decode("module.json")
    
    init() {
            _page = StateObject(wrappedValue: PageViewModel())
        }
    var body: some View {
        NavigationStack{
            ScrollView{
                ForEach(range, id: \.self){ item in
                    LazyVStack{
                        Divider()
                            .frame(height: 20)
                        Text("Semana \(item)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                            .bold()
                        Text("Modulo \(item + 1) ")
                            .foregroundColor(.white)
                            .font(.title3)
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                            .background(Color.blue)
                            .cornerRadius(5)
                            .padding(.horizontal, 20)
                        
                        ForEach(1..<8){ i in
                            NavigationLink(destination: page.screenType(for: .intro) ){
                                DayComponent(dayNumber: i)
                            }
                                    Text("Aula \(i)")
                                
                            
                        }
                    }
                }
                .navigationTitle("Início")
            }
        }
    }
}

#Preview {
    HomeView()
}
