//
//  SearchView.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 22/11/2025.
//

import SwiftUI
import UIKit

struct SearchView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var searchText = ""
    @FocusState private var isSearchFocused: Bool
    
    var body: some View {
        
        VStack {
            HStack {
//                Button {
//                    dismiss()
//                } label: {
//                    Image(systemName: "chevron.left")
//                        .font(.title2)
//                        .fontWeight(.medium)
//                        .foregroundStyle(.brandPrimary)
//                        .frame(width: 40, height: 40)
//                        .background()
//                }
                
                ButtonView(symbolName: "chevron.left", buttonSize: 40, action: {dismiss()})
                
                Spacer()
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)

                    TextField("Search for restaurants or items", text: $searchText)
                        .focused($isSearchFocused)
                        .frame(height: 50)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            isSearchFocused = true
                        }
                    
                    Spacer()

                    Button {
                        searchText = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal, 10)
                .frame(height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.searchBar)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.searchBarOutline.opacity(0.4), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SearchView()
}
