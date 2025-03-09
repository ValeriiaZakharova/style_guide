//
//  QuizColorItem.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 08.03.2025.
//

import SwiftUI

struct QuizColorItem: View {
    let title: String
    let color: Color
    @Binding var isSelected: Bool

    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            ZStack(alignment: .topTrailing) {
                VStack(spacing: 8) {
                    color
                        .frame(width: 32, height: 32)
                    Text(title.uppercased())
                        .font(.pMedium13)
                        .foregroundColor(.textPrimary)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                
                if isSelected {
                    ZStack {
                        Rectangle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(10)
            .border(isSelected ? .textPrimary : .strokeSecondary)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    QuizColorItem(title: "Light blue", color: .blue, isSelected: .constant(true))
}
