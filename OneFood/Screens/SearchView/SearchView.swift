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
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundStyle(.brandPrimary)
                        .frame(width: 40, height: 40)
                        .background()
                }
                
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
                .padding(.horizontal)
                .frame(height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
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
