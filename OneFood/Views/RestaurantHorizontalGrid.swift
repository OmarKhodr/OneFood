//
//  RestaurantHorizontalGrid.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 22/11/2025.
//

import SwiftUI

struct RestaurantHorizontalGrid: View {
    
    let title: String
    let restaurants: [Restaurant]
    
    let rows = [
            GridItem(.fixed(80)),
            GridItem(.fixed(80)),
            GridItem(.fixed(80))
        ]
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 16) {
                    ForEach(restaurants) { restaurant in
                        NavigationLink {
                            RestaurantDetailView(restaurant: restaurant, restaurantMenu: ModelData().menu[0])
                        } label: {
                            SmallRestaurantCard(restaurant: restaurant)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    RestaurantHorizontalGrid(title: "Test", restaurants: ModelData().restaurants)
}
