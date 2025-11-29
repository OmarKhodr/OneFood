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
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                            
                            Text("Search for restaurants or items")
                                .foregroundStyle(.gray)
                            
                            Spacer()
                        }
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                        )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            showSearch = true
                        }
                    }
                    .padding()
                    
                    VStack (alignment: .leading) {
                        Text("What's Popular")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.leading)
                        
                        RestaurantHorizontalGrid(restaurants: ModelData().restaurants)
                    }
                    .padding(.top, 5)
                    
                    Spacer()
                    
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
