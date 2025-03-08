//
//  OnboardingModel.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 05.03.2025.
//

import SwiftUI

// MARK: - Onboarding view model
struct OnboardingViewModel: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let subtitle: String
    let image: Image
}
