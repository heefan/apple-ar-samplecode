//
//  PlaneMovementApp.swift
//  PlaneMovement
//
//  Created by LI Tian on 24/7/24.
//

import SwiftUI

@main
struct PlaneMovementApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        .windowStyle(.volumetric)

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
//            ImmersiveView()
//                .environment(appModel)
//                .onAppear {
//                    appModel.immersiveSpaceState = .open
//                }
//                .onDisappear {
//                    appModel.immersiveSpaceState = .closed
//                }
            PlaneAnimationView()
        }
        .immersionStyle(selection: .constant(.full), in: .full)
    }
}
