//
//  ButtonView.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 05/12/2025.
//

import SwiftUI

struct ButtonView: View {
    let symbolName: String
    let buttonSize: CGFloat
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: symbolName)
                .font(.system(size: buttonSize / 2, weight: .medium))
                .foregroundStyle(Color("brandPrimary"))
                .frame(width: buttonSize, height: buttonSize)
        }
        .modifier(ConditionalButtonStyleModifier())
        
        
    }
}


private struct ConditionalButtonStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 26.0, *) {
            content
                .glassEffect(.clear.interactive())
        } else {
            content
                .background(Color("whiteBlack").opacity(0.5))
                .clipShape(Circle())
        }
    }
}



#Preview {
    VStack {
        ButtonView(symbolName: "chevron.left", buttonSize: 50, action: {})
    }
    .frame(width: 100, height: 100)
    .background(.gray)
}

//magnifyingglass
