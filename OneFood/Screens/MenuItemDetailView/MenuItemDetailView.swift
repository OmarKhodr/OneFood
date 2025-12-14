//
//  MenuItemDetailView.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 06/12/2025.
//

import SwiftUI

struct MenuItemDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let menuItem: MenuItem
    
    @State private var scrollOffset: CGFloat = 0
    
    private let navBarHeight: CGFloat = 70
    
    var body: some View {
        ZStack(alignment: .top) {
            
            StretchyHeaderView(imageName: menuItem.image, offset: scrollOffset, isIgnoringSafeArea: false)
            
            ScrollView {
                VStack (spacing: 0) {
                    OffsetReader()
                    
                    VStack (spacing: 0) {
                        VStack (alignment: .leading, spacing: 20) {
                            
                            Text(menuItem.name)
                                .font(.title)
                                .bold()
                            
                            Text(menuItem.description)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 250)
                    // .padding(.bottom, 170) //AddItemFoot height
                }
            }
            .coordinateSpace(name: "scrollViewCoordSpace")
            .onPreferenceChange(OffsetKey.self) { value in
                scrollOffset = value
            }
            .overlay(
                VStack(spacing: 0) {
                    CustomNavBar(
                        title: menuItem.name,
                        scrollOffset: scrollOffset,
                        leftButtonName: "xmark",
                        rightButtonName: "heart",
                        offsetToAppear: -100,
                        barHeight: navBarHeight,
                        hasSpacer: false,
                        onLeftButtonTap: {dismiss()},
                        onRightButtonTap: {}
                    )
                }
//                .padding(.top, 20)
                ,
                alignment: .top
            )
            .overlay (
                AddItemFooter()
                ,
                alignment: .bottom
            )
//            .overlay(
//                VStack {
//                    Text("Offset: \(Int(scrollOffset))")
//                        .padding()
//                        .background(.black.opacity(0.6))
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                        .padding()
//                }
//                
//            )
        }
        .background(.lightBack)
    }
}

#Preview {
    MenuItemDetailView(menuItem: ModelData().menu[0].menu[0].items[0])
}
