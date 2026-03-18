//
//  ParticleVisualizer.swift
//  emoticon-swift
//
//  Created by George McKinney on 3/17/26.
//
// from the video WWDC21 Adding Art with Swift UI https://www.youtube.com/watch?v=ShdhPjLLJUA&t=960s
// adds two sparkles that swing left to right
// adds more sparkles with clicks or taps on the canvas

import SwiftUI

struct ParticleVisualizer: View {
    var gradients: [Gradient]
    @State private var count = 2
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                let now = timeline.date.timeIntervalSinceReferenceDate
                let angle = Angle.degrees(now.remainder(dividingBy: 3) * 120)
                let x = cos(angle.radians)

                var image = context.resolve(Image(systemName: "sparkle"))
                image.shading = .color(.blue)
                let imageSize = image.size

                context.blendMode = .screen
                for i in 0..<count {
                    let frame = CGRect(
                        x: 0.5 * size.width + Double(i) * imageSize.width * x, y: 0.5 * size.height,
                        width: imageSize.width, height: imageSize.height)
                    var innerContext = context
                    innerContext.opacity = 0.5
                    innerContext.fill(Ellipse().path(in: frame), with: .color(.cyan))
                    context.draw(
                        image, in: frame)
                    /* context.draw(
                        image,
                        at: CGPoint(x: 0.5 * size.width + Double(i) * 10, y: 0.5 * size.height)) */

                }
            }
        }
        .onTapGesture {
            count += 1
        }
        .accessibilityLabel("A Particle Visualizer")
    }
}

struct ParticleView_Previews: PreviewProvider {
    static var previews: some View {
        ParticleVisualizer(gradients: [])
            .preferredColorScheme(.dark)
    }
}

#Preview {
    ParticleVisualizer(gradients: [])
}
