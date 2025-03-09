//
//  QuizViewModel.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 08.03.2025.
//

import SwiftUI

// MARK: - QuizStyle view model
struct QuizStyleViewModel: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let image: Image
    var isSelected: Bool = false
}

extension QuizStyleViewModel {
    static var model: [QuizStyleViewModel] {
        [
            QuizStyleViewModel(title: "Casual", image: Image(.casual)),
            QuizStyleViewModel(title: "BOHO", image: Image(.boho)),
            QuizStyleViewModel(title: "Classy", image: Image(.classy)),
            QuizStyleViewModel(title: "Ladylike", image: Image(.boho)),
            QuizStyleViewModel(title: "Urban", image: Image(.urban)),
            QuizStyleViewModel(title: "Sporty", image: Image(.sporty))
        ]
    }
}

// MARK: - QuizColor view model
struct QuizColorViewModel: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let color: Color
    var isSelected: Bool = false
}

extension QuizColorViewModel {
    static var model: [QuizColorViewModel] {
        [
            QuizColorViewModel(title: "Light blue", color: .lightBlue),
            QuizColorViewModel(title: "Blue", color: .blue),
            QuizColorViewModel(title: "Indigo", color: .indigo),
            QuizColorViewModel(title: "Turquoise", color: .turquoise),
            QuizColorViewModel(title: "Mint", color: .mint),
            QuizColorViewModel(title: "Olive", color: .olive),
            QuizColorViewModel(title: "Green", color: .green),
            QuizColorViewModel(title: "Emerald", color: .emerald),
            QuizColorViewModel(title: "Yellow", color: .yellow),
            QuizColorViewModel(title: "Beige", color: .beige),
            QuizColorViewModel(title: "Orange", color: .orange),
            QuizColorViewModel(title: "Brown", color: .brown),
            QuizColorViewModel(title: "Pink", color: .pink),
            QuizColorViewModel(title: "Magenta", color: .magenta),
            QuizColorViewModel(title: "Red", color: .red)
        ]
    }
}

// MARK: - QuizFocus view model
struct QuizFocusViewModel: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let subtitle: String
    var isSelected: Bool = false
}

extension QuizFocusViewModel {
    static var model: [QuizFocusViewModel] {
        [
            QuizFocusViewModel(title: "Reinvent wardrobe", subtitle: "to discover fresh outfit ideas"),
            QuizFocusViewModel(title: "Define color palette", subtitle: "to enhance my natural features"),
            QuizFocusViewModel(title: "Create a seasonal capsule", subtitle: "to curate effortless and elegant looks"),
            QuizFocusViewModel(title: "Define my style", subtitle: "to discover my signature look"),
            QuizFocusViewModel(title: "Create an outfit for an event", subtitle: "to own a spotlight wherever you go")
        ]
    }
}
