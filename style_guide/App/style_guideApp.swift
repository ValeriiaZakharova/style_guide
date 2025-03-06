//
//  style_guideApp.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 02.03.2025.
//

import SwiftUI
import ComposableArchitecture

@main
struct style_guideApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingView(store:Store(initialState: OnboardingViewReducer.State(), reducer: {
                OnboardingViewReducer()
            }))
        }
    }
}
