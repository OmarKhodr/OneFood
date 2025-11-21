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
            
            Spacer()
            
            VStack (alignment: .leading) {
                Text(restaurant.name)
                    .fontWeight(.semibold)
                Text(deliveryFeeText)
                    .foregroundStyle(.secondary)
                    .font(.callout)
                Text(deliveryTimeMinText)
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                
            }
        }
        .frame(width: 280, height: 80)
        .background(Color.yellow)
    }
}

#Preview {
    SmallRestaurantCard(restaurant: MockData.sampleRestaurant)
}
