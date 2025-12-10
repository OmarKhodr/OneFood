//
//  CategoryHeaderView.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 06/12/2025.
//
import SwiftUI

struct CategoryHeaderView: View {
    let categories: [String]
    let scrollOffset: CGFloat
    let categoryOffsets: [CGFloat]
    let topAreaHeight: CGFloat // this is the value of topSafeArea + customNavBar + CategoryHeaderView
    
    @State private var scrollPosition: ScrollPosition = .init(idType: Int.self)
    
    @State private var selectedCategoryID: String?
    
    @State private var categoriesAreVisible: Bool = false
    
    let onCategoryTap: (Int) -> Void
    
    var body: some View {
        
        // ZStack is used here to give the view bottom-only shadow
        ZStack(alignment: .bottom) {
            
            // This VStack is placed underneath the ScrollView at the bottom and has shadow.
            VStack{
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 10)
            .background(
                Color(.systemBackground)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            )
            
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(Array(categories.enumerated()), id: \.offset) { index, categoryName in
                            Button{
                                onCategoryTap(index)
                            }label: {
                                Text(categoryName)
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundColor(selectedCategoryID == categoryName ? Color("brandPrimary") : .primary)
                                    .padding(.vertical, 8)
                                    .overlay(
                                        // Underline indicator for selected item
                                        Rectangle()
                                            .frame(height: 2)
                                            .foregroundColor(selectedCategoryID == categoryName ? Color("brandPrimary") : .clear),
                                        alignment: .bottom
                                    )
                            }
                            .buttonStyle(PlainButtonStyle()) // Ensures no default button styling interference
                        }
                        
                    }
                    .padding(.horizontal)
                }
                .scrollPosition($scrollPosition, anchor: .center)
                
                Spacer()
                
            }
            .frame(height: 40)
            .background(
                Color(.systemBackground)
            )
            
        }
        .opacity(scrollOffset == 0 ? 0 : (categoriesAreVisible ? 1 : 0))
        .animation(.easeInOut(duration: 0.3), value: categoriesAreVisible)
        .onChange(of: scrollOffset, initial: false) { oldValue, newValue in
            updateSelectedCategory(for: -newValue + topAreaHeight) //this is the height of CustomNavBar + CategoryHeaderView + safeArea
            categoriesAreVisible = newValue < -300
        }
    }
    
    func updateSelectedCategory(for offset: CGFloat) {
        guard !categoryOffsets.isEmpty else { return }
        
        if (offset < categoryOffsets[0]) {
            selectedCategoryID = ""
            return
        }
        
        for i in 0..<categoryOffsets.count {
            let start = categoryOffsets[i]
            let end = i < categoryOffsets.count - 1 ? categoryOffsets[i+1] : .infinity
            
            if offset >= start && offset < end {
                if (categories[i] != selectedCategoryID) {
                    withAnimation(.easeInOut) {
                        scrollPosition.scrollTo(id: i)
                    }
                    selectedCategoryID = categories[i]
                }
                break
            }
        }
    }
}

//#Preview {
//    CategoryHeaderView(categories: ModelData().menu[0].menu.map { $0.category }, scrollOffset: -500, categoryOffsets: [], topSafeArea: 0)
//}
