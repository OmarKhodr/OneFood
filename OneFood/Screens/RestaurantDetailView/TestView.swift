//
//  TestView.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 04/12/2025.
//
import SwiftUI

struct TestView: View {
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
        ScrollView {
            VStack {
                OffsetReader()
            }
            .frame(height: 100)
            .background(.red)

            Rectangle().fill(.blue).frame(height: 400)

            
            VStack(spacing: 10) {
                ForEach(1...10, id: \.self) { num in
                    Text("Item \(num)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(8)
                }
            }
            .padding()
        }
//        .coordinateSpace(name: "scroll")
        .onPreferenceChange(OffsetKey.self) { value in
            scrollOffset = value
            print("OFFSET = \(value)")
        }
        .overlay(Text("Offset: \(Int(scrollOffset))").padding(), alignment: .top)
    }
}

#Preview { TestView() }
