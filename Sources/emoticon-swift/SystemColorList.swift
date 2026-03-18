//
//  SystemColorList.swift
//  emoticon-swift
//

import SwiftUI

struct SystemColorList: View {
    @Binding var color: Color
    var onRemove: () -> Void

    static let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink, .white, .black, .gray]

    var body: some View {
        VStack {
            HStack {
                ForEach(Self.colors, id: \.self) { c in
                    Circle()
                        .fill(c)
                        .frame(width: 24, height: 24)
                        .onTapGesture { color = c }
                }
            }
            Button("Remove Stop", action: onRemove)
                .foregroundColor(.red)
        }
    }

    struct Empty: View {
        var body: some View {
            Text("Select a stop to edit")
                .foregroundColor(.secondary)
        }
    }
}
