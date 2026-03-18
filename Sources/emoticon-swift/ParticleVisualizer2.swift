//
//  ParticleVisualizer2.swift
//  emoticon-swift
//
//  Created by George McKinney on 3/17/26.
//
// from the video WWDC21 Adding Art with Swift UI https://www.youtube.com/watch?v=ShdhPjLLJUA&t=960s
// adds a burst of gradient bubbles whereever you tap or click on the canvas

import SwiftUI

struct ParticleVisualizer2: View {
    var gradients: [Gradient]
    @StateObject private var model = ParticleModel()
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                let now = timeline.date.timeIntervalSinceReferenceDate
                model.update(time:now,size:size)
                
                context.blendMode = .screen
                model.forEachParticle { particle in
                    var innerContext = context
                    innerContext.opacity = particle.opacity
                    innerContext.fill(Ellipse().path(in: particle.frame), with: particle.shading(gradients))
                }
                
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onEnded { model.add(position: $0.location) }
        )
        .accessibilityLabel("A Particle Visualizer")
    }
}

struct ParticleView_Previews2: PreviewProvider {
    static var previews: some View {
        ParticleVisualizer2(gradients: [])
            .preferredColorScheme(.dark)
    }
}

#Preview {
    ParticleVisualizer2(gradients: [])
}
