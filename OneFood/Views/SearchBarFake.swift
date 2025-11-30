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
            
            Text("Search for restaurants or items")
                .foregroundStyle(.gray)
            
            Spacer()
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
        )
    }
}

#Preview {
    SearchBarFake()
}
