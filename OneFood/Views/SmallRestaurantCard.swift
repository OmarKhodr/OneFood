//
//  SmallRestaurantCard.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 21/11/2025.
//

import SwiftUI

struct SmallRestaurantCard: View {
    
    var restaurant: Restaurant
    
    private var deliveryFeeText: String {
        "AED \(String(format: "%.2f", restaurant.deliveryFee)) Delivery Fee"
    }
    
    private var deliveryTimeMinText: String {
        "\(restaurant.deliveryTimeMin) Min"
    }
    
    var body: some View {
        HStack {
            Image(restaurant.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 80)
                .clipped()
            
            
            VStack (alignment: .leading, spacing: 5) {
                Text(restaurant.name)
                    .font(.subheadline)
                Text(deliveryFeeText)
                    .foregroundStyle(.secondary)
                    .font(.caption)
                Text(deliveryTimeMinText)
                    .foregroundStyle(.secondary)
                    .font(.caption)
            }
            .padding(.leading, 8)
            
            Spacer()
        }
        .frame(width: 280, height: 80)
        .background(Color(.systemBackground))
        .cornerRadius(5)
    }
}

#Preview {
    SmallRestaurantCard(restaurant: ModelData().restaurants[0])
}
