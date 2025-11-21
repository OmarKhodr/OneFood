//
//  ContentView.swift
//  OneFood
//
//  Created by Omar Khodr on 01.11.2025.
//

import SwiftUI

struct OneFoodTabView: View {
    @State private var selection: TabOption = .home
    
    enum TabOption {
        case home
        case order
        case account
    }
    
    var body: some View {
        TabView(selection: $selection) {
            Tab("Home", systemImage: "house", value: TabOption.home) {
                HomeView()
            }
            Tab("Order", systemImage: "basket", value: TabOption.order) {
                OrderView()
            }
            Tab("Account", systemImage: "person", value: TabOption.account) {
                AccountView()
            }
        }
        .tint(.brandPrimary)
    }
}

#Preview {
    OneFoodTabView()
}
