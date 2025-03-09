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
            QuizStyleItemModel(title: "Sporty", image: Image("sporty"), isSelected: false),
            QuizStyleItemModel(title: "Casual", image: Image("casual"), isSelected: true),
            QuizStyleItemModel(title: "Formal", image: Image("urban"), isSelected: false),
            QuizStyleItemModel(title: "BOHO", image: Image("boho"), isSelected: true)
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
            QuizColorItemModel(title: "Light blue", color: .lightBlue),
            QuizColorItemModel(title: "Blue", color: .blue, isSelected: true),
            QuizColorItemModel(title: "Indigo", color: .indigo, isSelected: true),
            QuizColorItemModel(title: "Turquoise", color: .turquoise),
            QuizColorItemModel(title: "Mint", color: .mint),
            QuizColorItemModel(title: "Olive", color: .olive),
            QuizColorItemModel(title: "Green", color: .green)
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
