//
//  RestaurantDetailView.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 30/11/2025.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let restaurant: Restaurant
    let restaurantMenu: RestaurantMenu
    
    @State var topSafeArea: CGFloat = 0
    
    // New iOS 18 scroll position system
    @State private var scrollPosition: ScrollPosition = .init(idType: Int.self)
    
    @State private var scrollOffset: CGFloat = 0
    @State private var selectedCategoryID: String?
    @State private var categoryOffsets: [CGFloat] = [] // Stores calculated category offsets
    @State private var selectedMenuItem: MenuItem?
    
    private let navBarHeight: CGFloat = 60
    private let categoryBarHeight: CGFloat = 40
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack(alignment: .top) {
                
                StretchyHeaderView(
                    imageName: restaurant.imageName,
                    offset: scrollOffset,
                    isIgnoringSafeArea: true
                )
                
                ScrollView {
                    
                    VStack(spacing: 0) {
                        
                        OffsetReader()
                        
                        VStack {
                            // Empty space to skip the StretchyHeaderView
                        }
                        .ignoresSafeArea()
                        .frame(maxWidth: .infinity)
                        .frame(height: 250) // 250(StretchyHeaderView's height)
                        
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
                        MenuSectionView(restaurantMenu: restaurantMenu, scrollOffset: scrollOffset, categoryOffsets: $categoryOffsets, selectedMenuItem: $selectedMenuItem)
                        
                        
                        VStack {
                            // Empty space
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(.lightBack)
                        
                    }
                    
                }
                
                .scrollPosition($scrollPosition, anchor: .top)
                .coordinateSpace(name: "scrollViewCoordSpace")
                .onPreferenceChange(OffsetKey.self) { value in
                    scrollOffset = value
                }
                .ignoresSafeArea()
                .overlay(
                    VStack(spacing: 0) {
                        CustomNavBar(
                            title: restaurant.name,
                            scrollOffset: scrollOffset,
                            leftButtonName: "chevron.left",
                            rightButtonName: "magnifyingglass",
                            offsetToAppear: -100,
                            barHeight: navBarHeight,
                            hasSpacer: true,
                            onLeftButtonTap: {dismiss()},
                            onRightButtonTap: {}
                        )
                        
                        CategoryHeaderView(
                            categories: restaurantMenu.menu.map { $0.category },
                            scrollOffset: scrollOffset,
                            categoryOffsets: categoryOffsets,
                            topAreaHeight: geo.safeAreaInsets.top + navBarHeight + categoryBarHeight
                        ){ tappedCategoryIndex in
                            
                            scrollToCategory(at: tappedCategoryIndex, safeArea: geo.safeAreaInsets.top)
                            
                        }
                    },
                    alignment: .top
                )
                //                .overlay(
                //                    VStack {
                //                        Text("Offset: \(Int(scrollOffset))")
                //                            .padding()
                //                            .background(.black.opacity(0.6))
                //                            .foregroundColor(.white)
                //                            .cornerRadius(10)
                //                            .padding()
                //
                //                        Button {
                //                            printOffsets(categoryOffsets)
                //                        } label: {
                //                            Text("Print")
                //                                .frame(width: 50, height: 50)
                //                                .background(.red)
                //                        }
                //                    }
                //
                //                )
                
            }
            .navigationBarBackButtonHidden(true)
            .sheet(item: $selectedMenuItem) { menuItem in
                MenuItemDetailView(menuItem: menuItem)
            }
        }
        
        
        
        
    }
    
    func printOffsets(_ categoryOffsets: [CGFloat]) {
        for categoryOffset in categoryOffsets {
            print(categoryOffset)
        }
    }
    
    func scrollToCategory(at index: Int, safeArea: CGFloat) {
        
        withAnimation(.easeInOut) {
            scrollPosition.scrollTo(y: categoryOffsets[index] + 1 - (safeArea + 100))
        }
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
                            value: geo.frame(in: .named("scrollViewCoordSpace")).minY)
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
