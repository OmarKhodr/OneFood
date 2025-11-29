//
//  SearchView.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 22/11/2025.
//

import SwiftUI

struct SearchView: View {
    
//    @Environment(\.dismiss) var dismiss
    
    @State private var searchText = ""
    @FocusState private var isSearchFocused: Bool
    
    var body: some View {
        
        VStack {
            
        }
        .toolbar {

            ToolbarItem(placement: .principal) {
                HStack {
                    Image(systemName: "magnifyingglass")

                    TextField("Search for restaurants or items", text: $searchText)
                        .focused($isSearchFocused)
                    
                    Spacer()

                    Button {
                        searchText = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
                .contentShape(Rectangle())
                .onTapGesture {
                    isSearchFocused = true
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
