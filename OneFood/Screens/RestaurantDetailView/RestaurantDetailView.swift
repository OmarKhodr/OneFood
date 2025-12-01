//
//  RestaurantDetailView.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 30/11/2025.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    let restaurant: Restaurant
    @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            
            StretchyHeaderView(
                imageName: restaurant.imageName,
                offset: scrollOffset
            )
            
            ScrollView {
                
                OffsetReader()  // reads scrolling offset
                
                VStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(restaurant.name)
                            .font(.largeTitle.bold())
                        
                        Text("★ \(String(format: "%.1f", restaurant.rating)) good rating (500+)")
                        Text("Allergens and info")
                        Text("Delivery in \(restaurant.deliveryTimeMin) min")
                        Text("AED \(String(format: "%.1f", restaurant.deliveryFee)) Delivery Fee")
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)

                }
                .padding(.top, 200)
                
            }
        }
        .ignoresSafeArea()
        .onPreferenceChange(OffsetKey.self) { value in
            scrollOffset = value
        }
    }
}

#Preview {
    RestaurantDetailView(restaurant: ModelData().restaurants[0])
}


struct OffsetReader: View {
    var body: some View {
        GeometryReader { geo in
            Color.clear
                .preference(key: OffsetKey.self,
                            value: geo.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
    }
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
