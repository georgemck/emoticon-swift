//
//  ContentView.swift
//  emoticon-swift
//
//  Created by George McKinney on 3/15/26.
//
// The TimelineView wraps the Canvas where a shape is drawn into. The timeline runs on an interval that is frame rate of 60 fps
// A red oval moves right and left across the screen

import SwiftUI
struct CanvasView: View{
    @State private var lastFrameTime: Date = .now

    var body: some View {
        TimelineView(PeriodicTimelineSchedule(from: .now, by: 1.0 / 60.0)) { timeline in
            Canvas { context, size in
                let now: TimeInterval = timeline.date.timeIntervalSinceReferenceDate
                let xPos: Double = (sin(now * 3) * 200) + (size.width / 2)
                let rect: CGRect = CGRect(x: xPos, y: size.height / 2, width: 80, height: 50)
                // context.fill(Path(ellipseIn: rect), with: .color(.blue))
                context.fill(Path(ellipseIn: rect), with: .color(.red))
            }
            .onChange(of: timeline.date) { oldDate, newDate in
                let fps = 1.0 / newDate.timeIntervalSince(oldDate)
                print("FPS: \(fps)")
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    CanvasView()
}
