//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by duc on 02/05/2024.
//

import SwiftUI

@main
struct CitySights: App {
    
    @State var model = BusinessModel()
    @AppStorage("onboarding") var needsOnboarding = true // luu tru trong may
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(model)
                .fullScreenCover(isPresented: $needsOnboarding){
                    needsOnboarding = false
                } content: {
                    OnboardingView()
                        .environment(model)

                }//resent a view in full screen
        }
    }
}
