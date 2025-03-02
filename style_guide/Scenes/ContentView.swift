//
//  ContentView.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 02.03.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.emerald)
            Text("Hello, world!")
                .font(.kExtraBold28)
            Text("Hello, world!")
                .font(.pLight14)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
