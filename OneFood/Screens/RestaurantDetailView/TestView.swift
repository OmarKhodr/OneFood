//
//  TestView.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 04/12/2025.
//
import SwiftUI

struct TestView: View {
    @State private var scrollOffset: CGFloat = 0
    @State private var scrollPosition = ScrollPosition(idType: Int.self)

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) { // Use LazyVStack for performance
                ForEach(1...50, id: \.self) { num in
                    Text("Item \(num)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(8)
                        .id(num)
                }
            }
            .padding()
        }
        .scrollPosition($scrollPosition, anchor: .top)
        .overlay(
            VStack {
                Text("Offset: \(Int(scrollOffset))")
                    .padding()
                    .background(.black.opacity(0.6))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding()
                
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        scrollPosition.scrollTo(point: CGPoint(x: 0, y: 300))
                    }
                } label: {
                    Text("Scroll")
                        .padding()
                        .background(.black.opacity(0.6))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding()
                }
            },
            alignment: .top
        )
    }
}

#Preview { TestView() }
