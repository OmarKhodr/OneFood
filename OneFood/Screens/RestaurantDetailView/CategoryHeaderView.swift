//
//  CategoryHeaderView.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 06/12/2025.
//
import SwiftUI

struct CategoryHeaderView: View {
    let categories: [String]
    @Binding var selectedCategoryID: String?
    let jumpAction: (String) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(categories, id: \.self) { categoryName in
                    Button(action: {
                        jumpAction(categoryName)
                    }) {
                        Text(categoryName)
                            .font(.subheadline)
                            .fontWeight(selectedCategoryID == categoryName ? .bold : .medium)
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
                    .buttonStyle(PlainButtonStyle()) // Ensure no default button styling interference
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 8)
        }
//        .background(Color(.systemBackground).ignoresSafeArea(edges: .top))
//        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

//#Preview {
//    CategoryHeaderView(categories: <#[String]#>, selectedCategoryID: <#Binding<String?>#>, jumpAction: <#(String) -> Void#>)
//}
