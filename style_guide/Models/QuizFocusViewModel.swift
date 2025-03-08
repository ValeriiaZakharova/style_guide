//
//  QuizFocusViewModel.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 08.03.2025.
//

import SwiftUI

// MARK: - QuizFocus view model
struct QuizFocusViewModel: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let subtitle: String
    var isSelected: Bool = false
}

extension QuizFocusViewModel {
    static var models: [QuizFocusViewModel] {
        [
            QuizFocusViewModel(title: "Reinvent wardrobe", subtitle: "to discover fresh outfit ideas"),
            QuizFocusViewModel(title: "Define color palette", subtitle: "to enhance my natural features"),
            QuizFocusViewModel(title: "Create a seasonal capsule", subtitle: "to curate effortless and elegant looks"),
            QuizFocusViewModel(title: "Define my style", subtitle: "to discover my signature look"),
            QuizFocusViewModel(title: "Create an outfit for an event", subtitle: "to own a spotlight wherever you go")
        ]
    }
}
