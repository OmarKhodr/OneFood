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
    
    @State var topSafeArea: CGFloat = 0
    
    // New iOS 18 scroll position system
    @State private var scrollPosition: ScrollPosition = .init(idType: Int.self)
    
    @State private var scrollOffset: CGFloat = 0
    @State private var selectedCategoryID: String?
    @State private var categoryOffsets: [CGFloat] = [] // Stores all calculated category offsets
    
    private let navBarHeight: CGFloat = 60
    private let categoryBarHeight: CGFloat = 40
    
    var body: some View {
        
        GeometryReader { geo in
            
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
                            ForEach(restaurantMenu.menu.indices, id: \.self) { index in
                                let category = restaurantMenu.menu[index]
                                
                                GeometryReader { innerGeo in
                                    Color.clear
                                        .onAppear {
                                            categoryOffsets.append(innerGeo.frame(in: .named("scrollViewCoordSpace")).minY)
                                            
                                            categoryOffsets.sort()
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
                                scrollOffset: scrollOffset
                            )
                            
                            CategoryHeaderView(
                                categories: restaurantMenu.menu.map { $0.category },
                                scrollOffset: scrollOffset,
                                categoryOffsets: categoryOffsets,
                                topAreaHeight: geo.safeAreaInsets.top + navBarHeight + categoryBarHeight
                            ){ tappedCategoryIndex in
                                
                                scrollToCategory(at: tappedCategoryIndex, proxy: proxy, safeArea: geo.safeAreaInsets.top)
                                
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
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
    
    func printOffsets(_ categoryOffsets: [CGFloat]) {
        for categoryOffset in categoryOffsets {
            print(categoryOffset)
        }
    }
    
    func scrollToCategory(at index: Int, proxy: ScrollViewProxy, safeArea: CGFloat) {

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


// Class to store the category with their offset in an array
struct CategoryOffsetData: Identifiable, Equatable {
    var id: String { category } // category name as ID
    let category: String
    var offset: CGFloat = 0
}
