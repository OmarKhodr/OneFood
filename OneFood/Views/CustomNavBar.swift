//
//  CustomNavBar.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 02/12/2025.
//
import SwiftUI

struct CustomNavBar: View {
    
    let title: String
    let scrollOffset: CGFloat
    let leftButtonName: String
    let rightButtonName: String
    let offsetToAppear: CGFloat // the title and background appear at this offset
    let barHeight: CGFloat
    let hasSpacer: Bool
    
    let onLeftButtonTap: () -> Void
    let onRightButtonTap: () -> Void
    
    private let navButtonSize: CGFloat = 44
    
    @State private var isBackgroundAndTitleVisible: Bool = false
    
    
    var body: some View {
        
        VStack {
            HStack {
                ButtonView(symbolName: leftButtonName, buttonSize: navButtonSize, action: onLeftButtonTap)
                
                Spacer()
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .opacity(scrollOffset == 0 ? 0 : (isBackgroundAndTitleVisible ? 1 : 0))
                    .animation(.easeInOut(duration: 0.3), value: isBackgroundAndTitleVisible)
                
                Spacer()
                
                ButtonView(symbolName: rightButtonName, buttonSize: navButtonSize, action: onRightButtonTap)
            }
            .padding(.horizontal)
            
            if(hasSpacer) {
                Spacer()
            }
            
        }
        .frame(height: barHeight)
        .background(
            Color(.systemBackground)
                .opacity(scrollOffset == 0 ? 0 : (isBackgroundAndTitleVisible ? 1 : 0))
                .animation(.easeInOut(duration: 0.3), value: isBackgroundAndTitleVisible)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                .ignoresSafeArea(.all, edges: .top)
            
        )
        .onChange(of: scrollOffset, initial: false) { oldValue, newValue in
            isBackgroundAndTitleVisible = newValue < offsetToAppear
        }
    }
}

#Preview {
    CustomNavBar(
        title: "Test",
        scrollOffset: 100,
        leftButtonName: "chevron.left",
        rightButtonName: "magnifyingglass",
        offsetToAppear: 100,
        barHeight: 60,
        hasSpacer: false,
        onLeftButtonTap: {},
        onRightButtonTap: {}
    )
}
