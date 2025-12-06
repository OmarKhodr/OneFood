//
//  BackButton.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 03/12/2025.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        if #available(iOS 26.0, *) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundStyle(.brandPrimary)
                    .clipShape(.circle)
                    .padding(3)
            }
            .buttonStyle(.glass)
        } else {
            Image(systemName: "chevron.left")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(.brandPrimary)
                .frame(width: 44, height: 44)
                .background(Color.whiteBlack.opacity(0.5))
                .clipShape(.circle)
        }
    }
}

#Preview {
    BackButton()
}
