//
//  StretchyHeaderView.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 01/12/2025.
//

import SwiftUI

struct StretchyHeaderView: View {
    let imageName: String
    let offset: CGFloat
    let frameHeight: CGFloat = 250
    let isIgnoringSafeArea: Bool
    
    var body: some View {
        
        Image(imageName)
            .resizable()
            .scaledToFill()
            .offset(y: offset > 0 ? 0 : offset * 0.1)
            .frame(width: UIScreen.main.bounds.width, height: max(0, frameHeight + offset))
            .clipped()
            .ignoresSafeArea(isIgnoringSafeArea ? .all : [], edges: .top)
        
        
    }
}

#Preview {
    StretchyHeaderView(imageName: "zwz", offset: 0, isIgnoringSafeArea: false)
}
