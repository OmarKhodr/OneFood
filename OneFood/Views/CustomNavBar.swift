//
//  CustomNavBar.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 02/12/2025.
//
import SwiftUI

struct CustomNavBar: View {
    
    @Environment(\.dismiss) var dismiss
    
    let title: String
    let scrollOffset: CGFloat
    
    private let navButtonSize: CGFloat = 44
    
    @State private var isBackgroundAndTitleVisible: Bool = false
    
    
    var body: some View {
        
        VStack {
            HStack {
                ButtonView(symbolName: "chevron.left", buttonSize: navButtonSize, action: {dismiss()})
                
                Spacer()
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .opacity(scrollOffset == 0 ? 0 : (isBackgroundAndTitleVisible ? 1 : 0))
                    .animation(.easeInOut(duration: 0.3), value: isBackgroundAndTitleVisible)
                
                Spacer()
                
                ButtonView(symbolName: "magnifyingglass", buttonSize: navButtonSize, action: {})
            }
            .padding(.horizontal)
            
            Spacer()
            
        }
        .frame(height: 60)
        .background(
            Color(.systemBackground)
                .opacity(scrollOffset == 0 ? 0 : (isBackgroundAndTitleVisible ? 1 : 0))
                .animation(.easeInOut(duration: 0.3), value: isBackgroundAndTitleVisible)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                .ignoresSafeArea(.all, edges: .top)
            
        )
        .onChange(of: scrollOffset, initial: false) { oldValue, newValue in
            isBackgroundAndTitleVisible = newValue < -100
        }
    }
}

#Preview {
    CustomNavBar(title: "Test", scrollOffset: -101)
}
