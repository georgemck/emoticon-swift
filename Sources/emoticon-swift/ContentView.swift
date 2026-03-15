//
//  ContentView.swift
//  emoticon-swift
//
//  Created by George McKinney on 3/15/26.
//

import SwiftUI
struct ContentView: View{
    var body: some View{
        VStack {
            Text("Hello Symbol ")
            Image(systemName: "arrow.down.heart")
                .imageScale(.large)
                .foregroundStyle(.tint)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
