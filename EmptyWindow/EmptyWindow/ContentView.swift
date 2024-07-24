//
//  ContentView.swift
//  EmptyWindow
//
//  Created by LI Tian on 23/7/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var modelEntity: ModelEntity?

    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle) { phrase in
                if let model = phrase.model {
                    print(model)
                }
                return GeometryReader { geometry in
                    Color.red // Use a clear color to not affect the layout
                        .onAppear {
                            let frame = geometry.frame(in: .global)
                            print("View position: x = \(frame.minX), y = \(frame.minY)")
                            print("View size: width = \(frame.width), height = \(frame.height)")
                        }
                }
            }
        }
    }
}




#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}

