//
//  RestaurantsHome.swift
//  OneFood
//
//  Created by Omar Khodr on 01.11.2025.
//

import SwiftUI

struct RestaurantsHome: View {
    var body: some View {
        NavigationSplitView {
            Text("Restaurants Home")
                .navigationTitle("Home")
        } detail: {
            Text("Select a Restaurant")
        }
    }
}

#Preview {
    RestaurantsHome()
}
