//
//  RestaurantDetailView.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 30/11/2025.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    let restaurant: Restaurant
    let restaurantMenu: RestaurantMenu
    @State private var scrollOffset: CGFloat = 0
    @State private var selectedCategoryID: String?
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            StretchyHeaderView(
                imageName: restaurant.imageName,
                offset: scrollOffset
            )
            
            ScrollViewReader { proxy in
                
                ScrollView {
                    
                    VStack(spacing: 0) {
                        
                        OffsetReader()
                        
                        VStack {
                            // Empty space to skip the StretchyHeaderView
                        }
                        .ignoresSafeArea()
                        .frame(maxWidth: .infinity)
                        .frame(height: 250) // 250(StretchyHeaderView's height)
                        .id("TOP_ANCHOR")
                        
                        VStack (alignment: .leading, spacing: 20) {
                            
                            Text(restaurant.name)
                                .font(.largeTitle.bold())
                            
                            Text("★ \(String(format: "%.1f", restaurant.rating)) good rating (500+)")
                            Text("Allergens and info")
                            Text("Delivery in \(restaurant.deliveryTimeMin) min")
                            Text("AED \(String(format: "%.1f", restaurant.deliveryFee)) Delivery Fee")
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack {
                            // Empty space
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 20)
                        .background(.lightBack)
                        
                        // MARK: - MENU SECTION
                        ForEach(restaurantMenu.menu, id: \.category) { category in
                            
                            // This GeometryReader detects when this category is visible
                            GeometryReader { innerGeo in
                                Color.clear
                                    .preference(key: CategoryOffsetKey.self, value: innerGeo.frame(in: .named("scrollViewCoordSpace")).minY)
                                    .onPreferenceChange(CategoryOffsetKey.self) { minY in
                                        if minY <= 120 && minY >= 100 {
                                            selectedCategoryID = category.category
                                        }
                                    }
                            }
                            .frame(height: 0)
                            
                            Text(category.category)
                                .font(.title2.bold())
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.top, 30)
                                .padding(.bottom, 10)
                            
                            ForEach(category.items.indices, id: \.self) { index in
                                let item = category.items[index]
                                MenuItemView(item: item)
                                if index < category.items.count - 1 {
                                    Divider()
                                        .padding(.horizontal)
                                }
                                
                            }
                        }
                        .background(.lightBack)
                        
                        
                        VStack {
                            // Empty space
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 800)
                        .background(.lightBack)
                        
                    }
                    
                }
                .coordinateSpace(name: "scrollViewCoordSpace")
                .onPreferenceChange(OffsetKey.self) { value in
                    scrollOffset = value
                }
                .ignoresSafeArea()
                .overlay(
                    CustomNavBar(
                        title: restaurant.name,
                        scrollOffset: scrollOffset,
                        categories: restaurantMenu.menu.map { $0.category },
                        selectedCategoryID: $selectedCategoryID,
                        scrollViewProxy: proxy
                    ),
                    alignment: .top
                )
                //            .overlay(
                //                Text("Offset: \(Int(scrollOffset))")
                //                    .padding()
                //                    .background(.black.opacity(0.6))
                //                    .foregroundColor(.white)
                //                    .cornerRadius(10)
                //                    .padding(),
                //                alignment: .center
                //            )
            }
            
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    RestaurantDetailView(restaurant: ModelData().restaurants[0], restaurantMenu: ModelData().menu[0])
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

struct CategoryOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        // We only care about the highest value (closest to the top)
        value = nextValue()
    }
}
