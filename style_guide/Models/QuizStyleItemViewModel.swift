//
//  QuizStyleItemModel.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 08.03.2025.
//

import SwiftUI

struct QuizStyleItemModel: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let image: Image
    var isSelected: Bool = false
}

extension QuizStyleItemModel {
    static var model: [QuizStyleItemModel] {
        [
            QuizStyleItemModel(title: "Casual", image: Image(.casual)),
            QuizStyleItemModel(title: "BOHO", image: Image(.boho)),
            QuizStyleItemModel(title: "Classy", image: Image(.classy)),
            QuizStyleItemModel(title: "Ladylike", image: Image(.boho)),
            QuizStyleItemModel(title: "Urban", image: Image(.urban)),
            QuizStyleItemModel(title: "Sporty", image: Image(.sporty))
        ]
    }
}

struct QuizColorItemModel: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let color: Color
    var isSelected: Bool = false
}

extension QuizColorItemModel {
    static var model: [QuizColorItemModel] {
        [
            QuizColorItemModel(title: "Light blue", color: .lightBlue),
            QuizColorItemModel(title: "Blue", color: .blue),
            QuizColorItemModel(title: "Indigo", color: .indigo),
            QuizColorItemModel(title: "Turquoise", color: .turquoise),
            QuizColorItemModel(title: "Mint", color: .mint),
            QuizColorItemModel(title: "Olive", color: .olive),
            QuizColorItemModel(title: "Green", color: .green),
            QuizColorItemModel(title: "Emerald", color: .emerald),
            QuizColorItemModel(title: "Yellow", color: .yellow),
            QuizColorItemModel(title: "Beige", color: .beige),
            QuizColorItemModel(title: "Orange", color: .orange),
            QuizColorItemModel(title: "Brown", color: .brown),
            QuizColorItemModel(title: "Pink", color: .pink),
            QuizColorItemModel(title: "Magenta", color: .magenta),
            QuizColorItemModel(title: "Red", color: .red)
        ]
    }
}
