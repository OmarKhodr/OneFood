//
//  ContentView.swift
//  OneFood
//
//  Created by Omar Khodr on 01.11.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: TabOption = .home
    
    enum TabOption {
        case home
        case account
    }
    
    var body: some View {
        TabView(selection: $selection) {
            Tab("Home", systemImage: "house", value: TabOption.home) {
                RestaurantsHome()
            }
            Tab("Account", systemImage: "gear", value: TabOption.account) {
                AccountHost()
            }
        }
    }
}

#Preview {
    ContentView()
}
