//
//  RestaurantDetailView.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 30/11/2025.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    let restaurant: Restaurant
    
    var body: some View {
        VStack {
            Image(restaurant.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
            
            VStack (alignment: .leading, spacing: 20) {
                Text(restaurant.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("★ \(String(format: "%.1f", restaurant.rating)) good rating (500+)")
                
                Text("Allergens and info")
                
                Text("Delivery in \(restaurant.deliveryTimeMin) min")
                
                Text("AED \(String(format: "%.1f", restaurant.deliveryFee)) Delivery Fee")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
                
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    RestaurantDetailView(restaurant: ModelData().restaurants[1])
}
