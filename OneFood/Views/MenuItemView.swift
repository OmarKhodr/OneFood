//
//  MenuItemView.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 05/12/2025.
//

import SwiftUI

struct MenuItemView: View {
    let item: MenuItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.headline)
                    .fontWeight(.medium)
                    .lineLimit(1)
                
                Text("item.descriptionlaksdj")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Text("AED \(String(format: "%.2f", item.price))")
                    .font(.subheadline)
                    .padding(.top, 4)
            }
            
            Spacer()
            
            Image(item.image ?? "kfc")
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .cornerRadius(3)
            
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(Color(.systemBackground))
    }
}

#Preview {
    MenuItemView(item: ModelData().menu[0].menu[0].items[0])
}
