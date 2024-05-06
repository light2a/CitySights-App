//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by duc on 02/05/2024.
//

import SwiftUI

@main
struct CitySights_AppApp: App {
    
    @State var model = BusinessModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
    }
}
