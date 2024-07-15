//
//  WorldAppApp.swift
//  WorldApp
//
//  Created by LI Tian on 15/7/24.
//

import SwiftUI

@main
struct WorldApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
