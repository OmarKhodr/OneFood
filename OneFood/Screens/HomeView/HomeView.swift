//
//  RestaurantsHome.swift
//  OneFood
//
//  Created by Omar Khodr on 01.11.2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Deliver to ") +
                Text("Home").bold()
                
                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("Search for restaurants or items", text: $searchText)
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 2)
                )
                
                Spacer()
                
                Text("What's Popular")
                
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
