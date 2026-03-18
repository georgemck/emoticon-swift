//
//  GradientDetailView.swift
//  emoticon-swift
//
//  Created by George McKinney on 3/17/26.
//
// from the video WWDC21 Adding Art with Swift UI https://www.youtube.com/watch?v=ShdhPjLLJUA&t=960s
// creates two gradients: one with 2 colors and the other with 7 colors of the rainbow


import SwiftUI

struct GradientDetailView: View {
    @Binding var gradient: GradientModel
    @Binding var gradient2color: GradientModel
    @State private var isEditing: Bool = false
    @State private var selectedStopID: Int?

    var body: some View {
        ZStack {
            //            Spacer()
            //                .frame(height:10)
            VStack {
                if !isEditing {
                    LinearGradient(
                        gradient: gradient2color.gradient, startPoint: .leading, endPoint: .trailing
                    )
                    .frame(maxWidth: .infinity)
                    // .ignoresSafeArea(edges: .bottom)
                    //                        .frame(height: 100)

                    /*HStack {
                        ForEach(gradient2color.stops) { stop in
                            RoundedRectangle(cornerRadius: 6)
                                .fill(stop.color)
                                .frame(width: 30, height: 30)
                        }
                    }*/
                    LinearGradient(
                        gradient: gradient.gradient, startPoint: .leading, endPoint: .trailing
                    )
                    .frame(maxWidth: .infinity)
                    //                        .frame(height: 100)
                    /*HStack {
                        ForEach(gradient.stops) { stop in
                            RoundedRectangle(cornerRadius: 6)
                                .fill(stop.color)
                                .frame(width: 30, height: 30)
                        }
                    }*/
                    // Spacer()
                } else {
                    GradientControl(gradient: $gradient, selectedStopID: $selectedStopID)
                        .padding()

                    if let selectedStopID = selectedStopID {
                        SystemColorList(color: $gradient[stopID: selectedStopID].color) {
                            gradient.remove(selectedStopID)
                            self.selectedStopID = nil
                        }
                    } else {
                        SystemColorList.Empty()
                    }
                }
            }
            HStack {
                if isEditing {
                    TextField("Name", text: $gradient.name)
                } else {
                    gradient.name.isEmpty ? Text("New Gradient") : Text(gradient.name)
                }

                Spacer()
                Text("\(gradient.stops.count). colors")

            }
            .padding()
            .background()
        }
        .toolbar {
            Button(isEditing ? "Done" : "Edit") {
                isEditing.toggle()
            }
        }
        // .navigationBarTitleDisplayModel
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GradientDetailView(
                gradient: .constant(
                    GradientModel(
                        id: 0, name: "Rainbow",
                        stops: [
                            GradientStop(id: 0, color: .red),
                            GradientStop(id: 1, color: .orange),
                            GradientStop(id: 2, color: .yellow),
                            GradientStop(id: 3, color: .green),
                            GradientStop(id: 4, color: .blue),
                            GradientStop(id: 5, color: .indigo),
                            GradientStop(id: 6, color: .purple),
                        ])),
                gradient2color: .constant(
                    GradientModel(
                        id: 1, name: "Sunset",
                        stops: [
                            GradientStop(id: 0, color: .red),
                            GradientStop(id: 1, color: .blue),
                        ]))
            )
        }
    }
}

#Preview {
    @Previewable @State var gradient = GradientModel(
        id: 0, name: "Sunset",
        stops: [
            GradientStop(id: 0, color: .red),
            GradientStop(id: 1, color: .blue),
        ])
    @Previewable @State var lineargradient = GradientModel(
        id: 0, name: "Rainbow",
        stops: [
            GradientStop(id: 0, color: .red),
            GradientStop(id: 1, color: .orange),
            GradientStop(id: 3, color: .yellow),
            GradientStop(id: 4, color: .green),
            GradientStop(id: 5, color: .blue),
            GradientStop(id: 6, color: .indigo),
            GradientStop(id: 7, color: .purple),
        ])
    //    GradientDetailView(gradient: $gradient)
    //    GradientDetailView(gradient: $lineargradient)
    GradientDetailView(gradient: $gradient, gradient2color: $lineargradient)
}
