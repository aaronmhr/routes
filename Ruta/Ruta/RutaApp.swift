//
//  RutaApp.swift
//  Ruta
//
//  Created by Aaron on 28/11/2023.
//

import SwiftUI

@main
struct RutaApp: App {
    let container = AppContainer()

    var body: some Scene {
        WindowGroup {
            container.makeLaunchView()
        }
    }
}
