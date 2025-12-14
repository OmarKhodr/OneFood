//
//  MenuSectionView.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 11/12/2025.
//

import SwiftUI

struct MenuSectionView: View {
    
    let restaurantMenu: RestaurantMenu
    
    let scrollOffset: CGFloat
        
    @Binding var categoryOffsets: [CGFloat]
    @Binding var selectedMenuItem: MenuItem?
    
    var body: some View {
        
        ForEach(restaurantMenu.menu, id: \.self) { category in
            
            GeometryReader { innerGeo in
                Color.clear
                    .onAppear {
                        if(scrollOffset == 0) {
                            let offset = innerGeo.frame(in: .named("scrollViewCoordSpace")).minY
                            
                            if !categoryOffsets.contains(offset) {
                                categoryOffsets.append(offset)
                                categoryOffsets.sort()
                            }
                            
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
            
            ForEach(category.items, id: \.self) { item in
                MenuItemView(item: item)
                    .onTapGesture {
                        selectedMenuItem = item
                    }
                if item.id != category.items.last?.id { // prevents last divider
                    Divider().padding(.horizontal)
                }
                
            }
        }
        .background(.lightBack)
    }
}

#Preview {
//    MenuSectionView(restaurantMenu: ModelData().menu[0], categoryOffsets: [1], selectedMenuItem: nil)
}
