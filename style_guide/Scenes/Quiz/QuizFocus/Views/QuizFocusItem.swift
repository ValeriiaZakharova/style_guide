//
//  QuizFocusItem.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 08.03.2025.
//

import SwiftUI

struct QuizFocusItem: View {

    let title: String
    let subtitle: String
    @Binding var isSelected: Bool

    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title.uppercased())
                        .font(.pMedium13)
                        .foregroundColor(.textPrimary)
                    Text(subtitle)
                        .font(.pLight14)
                        .foregroundColor(.textPrimary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
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
            .frame(maxWidth: .infinity)
            .padding(20)
            .border(isSelected ? .textPrimary : .strokeSecondary)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    QuizFocusItem(title: "Title", subtitle: "Subtitle", isSelected: .constant(false))
}
