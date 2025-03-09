//
//  QuizStyleItem.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 08.03.2025.
//

import SwiftUI

struct QuizStyleItem: View {

    let title: String
    let image: Image
    @Binding var isSelected: Bool

    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack {
                VStack(alignment: .center, spacing: 4) {
                    image
                        .resizable()
                        .scaledToFit()

                    Text(title.uppercased())
                        .font(isSelected ? .pMedium13 : .pLight13)
                        .foregroundColor(.textPrimary)
                }
                Spacer()
            }
            .padding(8)
            Button(action: {
                isSelected.toggle()
            }) {
                ZStack {
                    Rectangle()
                        .stroke(isSelected ? .textPrimary : .strokeSecondary, lineWidth: 1)
                        .frame(width: 20, height: 20)
                        .background(isSelected ? Color.black : Color.clear)
                    if isSelected {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(10)
        }
        .overlay(
            Rectangle()
                .stroke(isSelected ? .textPrimary : .strokeSecondary, lineWidth: 1)
        )
    }
}

#Preview {
    QuizStyleItem(title: "Title", image: Image(.sporty), isSelected: .constant(false))
}
