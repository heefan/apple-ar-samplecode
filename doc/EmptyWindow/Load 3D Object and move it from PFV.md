

Load 3D object

```swift
import SwiftUI
import RealityKit

struct ContentView: View {
    var body: some View {
        RealityView { content in
            // Create the cube (which will act as our "vehicle")
            let cube = ModelEntity(mesh: .generateBox(size: 0.2))
            cube.model?.materials = [SimpleMaterial(color: .blue, isMetallic: true)]
            
            // Create a camera entity
            let camera = PerspectiveCamera()
            
            // Create an anchor for our scene
            let sceneAnchor = AnchorEntity(world: .zero)
            
            // Add the cube to the scene anchor
            sceneAnchor.addChild(cube)
            
            // Position the camera slightly above and behind the cube's center
            // to simulate a driver's view
            camera.position = [0, 0.1, 0.2]
            
            // Add the camera as a child of the cube
            // This will make the camera move with the cube
            cube.addChild(camera)
            
            // Add the scene anchor to the content
            content.add(sceneAnchor)
            
            // Create the movement animation for the cube
            let movement = Transform(translation: [0, 0, -5])
            
            // Animate the cube (and by extension, the camera)
            cube.move(to: movement, relativeTo: sceneAnchor, duration: 3, timingFunction: .linear)
        }
    }
}
```
