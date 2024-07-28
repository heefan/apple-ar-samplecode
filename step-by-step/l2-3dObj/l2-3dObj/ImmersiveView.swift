//
//  ImmersiveView.swift
//  l2-3dObj
//
//  Created by LI Tian on 27/7/24.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct ImmersiveView: View {
    @State private var modelEntity: Entity?

    var body: some View {
        RealityView { content in
            let anchor = AnchorEntity(.plane(.horizontal, classification: .floor, minimumBounds: SIMD2<Float>(0.5, 0.5)))
            content.add(anchor)
            
            if let modelEntity = modelEntity {
                anchor.addChild(modelEntity)
            }
        } update: { content in
            if let modelEntity = modelEntity {
                if let anchor = content.entities.first as? AnchorEntity {
                    if anchor.children.isEmpty {
                        anchor.addChild(modelEntity)
                    }
                }
            }
        }
        .task {
            do {
                let url = URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/biplane/toy_biplane_idle.usdz")!
                let loadedModel = try await Entity(contentsOf: url)
                self.modelEntity = loadedModel
            } catch {
                print("Error loading model: \(error)")
            }
        }
    }
}

//struct ImmersiveView: View {
//    private let url = URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/biplane/toy_biplane_idle.usdz")!
//    @State private var model: Entity?
//    
//    var body: some View {
//        RealityView { content in
//            Task {
//                  do {
//                      let url = URL(string: "https://example.com/path/to/your/3d-model.usdz")!
//                      let loadedModel = try await Entity(contentsOf: url)
//                      model = loadedModel
//                      loadedModel.position = [0, 0, -1] // Set position directly on the model
//                      content.add(loadedModel)
//                  } catch {
//                      print("Error loading model: \(error)")
//                  }
//              }
//        }
//    }
//    
//}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
