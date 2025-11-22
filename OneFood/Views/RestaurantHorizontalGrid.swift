//
//  RestaurantHorizontalGrid.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 22/11/2025.
//

import SwiftUI

struct RestaurantHorizontalGrid: View {
    
    let restaurants: [Restaurant]
    
    let rows = [
            GridItem(.fixed(80)),
            GridItem(.fixed(80)),
            GridItem(.fixed(80))
        ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 16) {
                ForEach(restaurants) { restaurant in
                    SmallRestaurantCard(restaurant: restaurant)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    RestaurantHorizontalGrid(restaurants: ModelData().restaurants)
}
