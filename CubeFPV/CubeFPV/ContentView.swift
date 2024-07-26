//
//  ContentView.swift
//  CubeFPV
//
//  Created by LI Tian on 25/7/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    @State private var cameraTransform = Transform()
    
    var body: some View {
        RealityView { content in
            let rootEntity = Entity()
            content.add(rootEntity)
            
            let cube = ModelEntity(mesh: .generateBox(size: 0.5), materials: [SimpleMaterial(color: .blue, isMetallic: false)])
            cube.position = [0, 0, -0.5]
            rootEntity.addChild(cube)
            
            // Create the animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                // Create the animation after a delay to ensure the scene has loaded
                let movement = Transform(translation: [1, 1, -0.5])
                
                // Animate the cube
                cube.move(to: movement, relativeTo: rootEntity, duration: 3, timingFunction: .linear)
            }
        }
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
        .environment(AppModel())
}
