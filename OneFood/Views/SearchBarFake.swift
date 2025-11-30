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
                .fill(Color.white)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}

#Preview {
    SearchBarFake()
}
