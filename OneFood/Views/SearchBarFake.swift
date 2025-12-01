//
//  SearchBarFake.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 30/11/2025.
//

import SwiftUI

struct SearchBarFake: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.title2)
            
            Text("Search for restaurants or items")
                .foregroundStyle(.gray)
            
            Spacer()
        }
        .padding(.horizontal, 10)
        .frame(height: 50)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.searchBar)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(.searchBarOutline.opacity(0.3), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.10), radius: 6, x: 0, y: 3)
    }
}

#Preview {
    SearchBarFake()
}
