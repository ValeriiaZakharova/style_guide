//
//  GridView.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 09.03.2025.
//

import SwiftUI

struct GridView<Item: Identifiable, Content: View>: View {
    let items: [Item]
    let columns: [GridItem]
    let content: (Item) -> Content

    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(items) { item in
                content(item)
            }
        }
    }
}

#Preview {
    GridView(
        items: [
            QuizStyleViewModel(title: "Sporty", image: Image("sporty"), isSelected: false),
            QuizStyleViewModel(title: "Casual", image: Image("casual"), isSelected: true),
            QuizStyleViewModel(title: "Formal", image: Image("urban"), isSelected: false),
            QuizStyleViewModel(title: "BOHO", image: Image("boho"), isSelected: true)
        ],
        columns: [
            GridItem(.flexible(), spacing: 12),
            GridItem(.flexible(), spacing: 12)
        ]
    ) { item in
        QuizStyleItem(
            title: item.title,
            image: item.image,
            isSelected: .constant(item.isSelected)
        )
    }

    GridView(
        items: [
            QuizColorViewModel(title: "Light blue", color: .lightBlue),
            QuizColorViewModel(title: "Blue", color: .blue, isSelected: true),
            QuizColorViewModel(title: "Indigo", color: .indigo, isSelected: true),
            QuizColorViewModel(title: "Turquoise", color: .turquoise),
            QuizColorViewModel(title: "Mint", color: .mint),
            QuizColorViewModel(title: "Olive", color: .olive),
            QuizColorViewModel(title: "Green", color: .green)
        ],
        columns: [
            GridItem(.flexible(), spacing: 12),
            GridItem(.flexible(), spacing: 12),
            GridItem(.flexible(), spacing: 12)
        ]
    ) { item in
        QuizColorItem(
            title: item.title,
            color: item.color,
            isSelected: .constant(item.isSelected)
        )
    }
}
