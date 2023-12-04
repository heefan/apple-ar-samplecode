//
//  HelloWorldApp.swift
//  HelloWorld
//
//  Created by LI Tian on 3/11/23.
//

import SwiftUI

@main
struct HelloWorldApp: App {
    var body: some Scene {
        WindowGroup("Hello World") {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
