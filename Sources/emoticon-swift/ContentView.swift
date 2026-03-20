//
//  ContentView.swift
//  emoticon-swift
//
//  Created by George McKinney on 3/15/26.
//
// a hello world example that loads images contained within the Xcode environment

import SwiftUI
struct ContentView: View{
    var body: some View{
        VStack {
            Text("Hello Symbol ")
                .font(Font.largeTitle)
                .navigationTitle("Hello World")
            Spacer()
                .frame(width:200,height: 100)
            Image(systemName: "arrow.down.heart")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Spacer()
                .frame(width:200,height: 100)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
