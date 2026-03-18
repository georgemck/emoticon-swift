//
//  GradientControl.swift
//  emoticon-swift
//

import SwiftUI

struct GradientControl: View {
    @Binding var gradient: GradientModel
    @Binding var selectedStopID: Int?

    var body: some View {
        HStack {
            ForEach(gradient.stops) { stop in
                Circle()
                    .fill(stop.color)
                    .frame(width: 30, height: 30)
                    .overlay(Circle().stroke(selectedStopID == stop.id ? Color.white : Color.clear, lineWidth: 2))
                    .onTapGesture { selectedStopID = stop.id }
            }
        }
    }
}
