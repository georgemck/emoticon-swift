//
//  ParticleModel.swift
//  emoticon-swift
//

import SwiftUI

struct Particle {
    var position: CGPoint
    var velocity: CGVector
    var opacity: Double
    var radius: Double
    var gradientIndex: Int

    var frame: CGRect {
        CGRect(x: position.x - radius, y: position.y - radius, width: radius * 2, height: radius * 2)
    }

    func shading(_ gradients: [Gradient]) -> GraphicsContext.Shading {
        guard !gradients.isEmpty else { return .color(.white) }
        let gradient = gradients[gradientIndex % gradients.count]
        return .linearGradient(gradient, startPoint: CGPoint(x: frame.minX, y: frame.minY), endPoint: CGPoint(x: frame.maxX, y: frame.maxY))
    }

    mutating func update(dt: Double, size: CGSize) {
        position.x += velocity.dx * dt
        position.y += velocity.dy * dt
        velocity.dy += 50 * dt
        opacity -= dt * 0.5
    }

    var isAlive: Bool { opacity > 0 }
}

@MainActor
class ParticleModel: ObservableObject {
    private var particles: [Particle] = []
    private var lastTime: Double = 0

    func update(time: Double, size: CGSize) {
        let dt = lastTime == 0 ? 0 : time - lastTime
        lastTime = time
        particles = particles.filter { $0.isAlive }.map {
            var p = $0
            p.update(dt: dt, size: size)
            return p
        }
    }

    func forEachParticle(_ block: (Particle) -> Void) {
        particles.forEach(block)
    }

    func add(position: CGPoint) {
        for _ in 0..<10 {
            let angle = Double.random(in: 0..<2 * .pi)
            let speed = Double.random(in: 50...150)
            particles.append(Particle(
                position: position,
                velocity: CGVector(dx: cos(angle) * speed, dy: sin(angle) * speed),
                opacity: 1.0,
                radius: Double.random(in: 5...15),
                gradientIndex: Int.random(in: 0..<10)
            ))
        }
    }
}
