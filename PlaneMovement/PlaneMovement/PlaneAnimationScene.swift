//
//  PlaneAnimationScene.swift
//  PlaneMovement
//
//  Created by LI Tian on 24/7/24.
//

import SwiftUI
import RealityKit

struct PlaneAnimationView: View {
    var body: some View {
        RealityView { content in
            // Create a simple plane entity
            let plane = ModelEntity(mesh: .generatePlane(width: 0.5, depth: 0.5),
                                    materials: [SimpleMaterial(color: .blue, isMetallic: true)])
            
            // Create an anchor and add the plane to it
            let anchor = AnchorEntity()
            anchor.addChild(plane)
            
            // Add the anchor to the content
            content.add(anchor)
            
            // Define the waypoints
            let waypoints = [
                SIMD3<Float>(100, 90, 40),
                SIMD3<Float>(80, 70, 20),
                SIMD3<Float>(70, 40, 10)
            ]
            
            // Create and start the animation
            animatePlane(plane, through: waypoints, duration: 3.0)
        }
    }
    
    func animatePlane(_ plane: ModelEntity, through waypoints: [SIMD3<Float>], duration: TimeInterval) {
            guard waypoints.count > 1 else { return }
            
            let totalDuration = duration
            let stepDuration = totalDuration / TimeInterval(waypoints.count - 1)
            
            for i in 0..<(waypoints.count - 1) {
                let startPosition = waypoints[i]
                let endPosition = waypoints[i+1]
                
                let startTransform = Transform(scale: .one,
                                               rotation: simd_quatf(),
                                               translation: startPosition)
                let endTransform = Transform(scale: .one,
                                             rotation: simd_quatf(),
                                             translation: endPosition)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(i) * stepDuration) {
                    plane.move(to: endTransform,
                               relativeTo: nil,
                               duration: stepDuration,
                               timingFunction: .linear)
                }
            }
        }
}
