//
//  ContentView.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 22/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        LoginView()
      
    }
}

#Preview {
    ContentView()
}
