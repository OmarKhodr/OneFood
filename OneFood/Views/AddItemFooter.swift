//
//  AddItemFooter.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 13/12/2025.
//

import SwiftUI

struct AddItemFooter: View {
    @State var count: Int = 1
    var body: some View {
        VStack (spacing: 30) {
            HStack(spacing: 40) {
                Button {
                    count -= 1
                } label: {
                    Image(systemName: "minus.circle")
                        .font(.system(size: 25))
                        .foregroundStyle(count == 1 ? Color(.gray): Color("brandPrimary"))
                }
                .disabled(count == 1)
                
                Text("\(count)")
                    .font(.title2)
                    .bold()
                    .frame(width: 70)
                
                Button {
                    count += 1
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 25))
                        .foregroundStyle(Color("brandPrimary"))
                }
            }
            
            Button {
                
            } label: {
                Text("Add for AED 150")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.primary)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.brandPrimary)
                    .cornerRadius(10)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 170)
        .background()
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -2)
    }
}

#Preview {
    AddItemFooter()
}
