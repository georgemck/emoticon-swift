// The Swift Programming Language
// https://docs.swift.org/swift-book
//
// this is the main program. Within the Vstack various views show different graphics
// comment and uncomment to focus on one to explore


import SwiftUI

@main
struct emoticon_swift: App {
    @State private var gradient = GradientModel(
        id: 0, name: "Rainbow",
        stops: [
            GradientStop(id: 0, color: .red),
            GradientStop(id: 1, color: .orange),
            GradientStop(id: 2, color: .yellow),
            GradientStop(id: 3, color: .green),
            GradientStop(id: 4, color: .blue),
            GradientStop(id: 5, color: .indigo),
            GradientStop(id: 6, color: .purple),
        ])
    @State private var gradient2color = GradientModel(
        id: 1, name: "Sunset",
        stops: [
            GradientStop(id: 0, color: .red),
            GradientStop(id: 1, color: .blue),
        ])

    var body: some Scene {
        WindowGroup {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 20)
                NavigationLink(destination: ContentView()){
                    Text("Hello Symbol")
                        .font(.system(size: 40))
                }
                Spacer()
                    .frame(height: 20)
                NavigationLink(destination: CanvasView()){
                    Text("Moving Red Oval")
                        .font(.system(size: 40))
                }
                Spacer()
                    .frame(height: 20)
                NavigationLink(destination: GradientDetailView(gradient: $gradient, gradient2color: $gradient2color)){
                    Text("Sunsets and Rainbows")
                        .font(.system(size: 40))
                }
                Spacer()
                    .frame(height: 20)
                NavigationLink(destination: ParticleVisualizer(gradients: [gradient.gradient, gradient2color.gradient])){
                    Text("Particles")
                        .font(.system(size: 40))
                }
                Spacer()
                    .frame(height: 20)
                NavigationLink(destination: ParticleVisualizer2(gradients: [gradient.gradient, gradient2color.gradient])){
                    Text("Touch Particles")
                        .font(.system(size: 40))
                }
            }
        }}
    }
}

//struct emoticon_swift {
//    static func main() {
//        print("Hello, world!")
//    }
//}


#Preview {
    //EmptyView()
    ContentView()
    //CanvasView()
}
