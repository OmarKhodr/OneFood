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
    let categories: [String]
    @Binding var selectedCategoryID: String?
    let scrollViewProxy: ScrollViewProxy
    
    private let navButtonSize: CGFloat = 44
    private var categoriesAreVisible: Bool {
        scrollOffset < -300 // Fade in when header is mostly gone
    }
    
    // Function to jump to a specific ID using the proxy
    func scrollToCategory(_ categoryID: String) {
        withAnimation(.easeInOut) {
            scrollViewProxy.scrollTo(categoryID)
        }
    }
    
    var body: some View {
        VStack (spacing: 0) {
            
            HStack {
                ButtonView(symbolName: "chevron.left", buttonSize: navButtonSize, action: {dismiss()})
                
                Spacer()
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .opacity(scrollOffset < -100 ? 1 : 0)
                    .animation(.easeInOut, value: scrollOffset < -100)
                
                Spacer()
                
                ButtonView(symbolName: "magnifyingglass", buttonSize: navButtonSize, action: {})
            }
            .padding(.bottom, 10)
            .padding(.horizontal)
//            .background(
//                Color(.systemBackground)
//                    .opacity(scrollOffset < -100 ? 1 : 0)
//                    .animation(.easeInOut, value: scrollOffset < -100)
//                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
//                    .ignoresSafeArea(.all, edges: .top)
//            )
            
            // Horizontal Category List (Fades in)
            if categoriesAreVisible {
                CategoryHeaderView(
                    categories: categories,
                    selectedCategoryID: $selectedCategoryID,
                    jumpAction: scrollToCategory
                )
                .transition(.opacity.animation(.easeInOut(duration: 0.3)))
            }
        }
        .background(
            Color(.systemBackground)
                .opacity(scrollOffset < -100 ? 1 : 0)
                .animation(.easeInOut, value: scrollOffset < -100)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                .ignoresSafeArea(.all, edges: .top)
        )
    }
}

//#Preview {
//    CustomNavBar(title: "Test", scrollOffset: -101, categories: ModelData().menu[0].menu[0].)
//}
