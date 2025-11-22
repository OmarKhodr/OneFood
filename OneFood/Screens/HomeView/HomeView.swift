//
//  RestaurantsHome.swift
//  OneFood
//
//  Created by Omar Khodr on 01.11.2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchText = ""
    @FocusState private var isSearchFocused: Bool
    
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
                            
                            TextField("Search for restaurants or items", text: $searchText)
                                .focused($isSearchFocused)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                        )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            isSearchFocused = true
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
            }
            .scrollDismissesKeyboard(.interactively)
            .background(Color.clear.onTapGesture {
                isSearchFocused = false
            })
        }
    }
}

#Preview {
    HomeView()
}
