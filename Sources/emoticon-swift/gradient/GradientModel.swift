//
//  GradientModel.swift
//  emoticon-swift
//

import SwiftUI

struct GradientStop: Identifiable {
    let id: Int
    var color: Color
}

struct GradientModel: Identifiable {
    let id: Int
    var name: String
    var stops: [GradientStop]

    var gradient: Gradient {
        Gradient(colors: stops.map { $0.color })
    }

    subscript(stopID id: Int) -> GradientStop {
        get { stops.first { $0.id == id } ?? GradientStop(id: id, color: .clear) }
        set { if let i = stops.firstIndex(where: { $0.id == id }) { stops[i] = newValue } }
    }

    mutating func remove(_ id: Int) {
        stops.removeAll { $0.id == id }
    }
}
