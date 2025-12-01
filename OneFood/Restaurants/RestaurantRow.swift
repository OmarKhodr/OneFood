//
//  RestaurantRow.swift
//  OneFood
//
//  Created by Omar Khodr on 05.11.2025.
//

import SwiftUI

struct RestaurantRow: View {
    var rowName: String
    var items: [Restaurant]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(rowName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { restaurant in
                        NavigationLink {
                            RestaurantDetailView(restaurant: restaurant)
                        } label: {
                            RestaurantItem(restaurant: restaurant)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    RestaurantRow(rowName: "Featured", items: ModelData().restaurants)
}
