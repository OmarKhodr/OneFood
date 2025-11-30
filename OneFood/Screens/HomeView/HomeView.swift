//
//  RestaurantsHome.swift
//  OneFood
//
//  Created by Omar Khodr on 01.11.2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showSearch = false
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        HStack (spacing: 2) {
                            Text("Deliver to ")
                            Text("Home").bold()
                            Image(systemName: "chevron.down")
                                .padding(.leading, 5)
                                .foregroundColor(.brandPrimary)
                        }
                        
                        SearchBarFake()
                        .onTapGesture {
                            showSearch = true
                        }
                    }
                    .padding()
                    
                    RestaurantHorizontalGrid(title: "What's popular", restaurants: ModelData().restaurants)
                    .padding(.top, 5)
                    
                }
                .navigationDestination(isPresented: $showSearch) {
                    SearchView()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
