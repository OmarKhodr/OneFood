//
//  RestaurantItem.swift
//  OneFood
//
//  Created by Omar Khodr on 02.11.2025.
//

import SwiftUI

struct RestaurantItem: View {
    var restaurant: Restaurant
    
    // TODO: generalize currency
    private var deliveryFeeText: String {
        "CHF \(String(format: "%.2f", restaurant.deliveryFee)) Delivery Fee"
    }
    
    private var deliveryTimeMinText: String {
        "\(restaurant.deliveryTimeMin) Min"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            restaurant.image
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 260, height: 130)
                .cornerRadius(16)
            VStack(alignment: .leading, spacing: -1) {
                Text(restaurant.name)
                    .foregroundStyle(.primary)
//                    .font(.default)
                    .fontWeight(.semibold)
                Text(deliveryFeeText)
                    .foregroundStyle(.secondary)
                    .font(.callout)
                HStack(spacing: 4) {
                    HStack(spacing: 2) {
                        Text(String(format: "%.1f", restaurant.rating))
                            .font(.callout)
                        Image(systemName: "star.fill").font(.footnote)
                    }
                    Text("·")
                    Text(deliveryTimeMinText)
                }
                .foregroundStyle(.secondary)
                .font(.callout)
            }
        }
        .padding(.leading, 15)
    }
}

#Preview {
    RestaurantItem(restaurant: ModelData().restaurants[0])
}
