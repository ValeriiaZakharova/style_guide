//
//  PurchaseHotButton.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 09.03.2025.
//

import SwiftUI

struct PurchaseButton: View {

    let title: String
    let description: String
    let price: String
    let isTrial: Bool
    @Binding var isSelected: Bool

    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            VStack(spacing: .zero) {
                if isTrial {
                    Text("HOT DEAL 🔥 ")
                        .frame(maxWidth: .infinity)
                        .font(.pSemiBold10)
                        .foregroundStyle(.textPrimaryWhite)
                        .padding(.vertical, 4)
                        .background(.black)
                }
                VStack(spacing: 20) {
                    VStack(alignment: .center, spacing: 4) {
                        Text(title)
                            .font(.pMedium16)
                            .foregroundColor(.textPrimary)
                            .lineLimit(3)
                        if !isTrial {
                            Text(price)
                                .font(.pRegular16)
                                .foregroundColor(.textPrimary)
                        }
                    }
                    Text(description)
                        .lineLimit(3)
                        .font(.pLight14)
                        .foregroundColor(.textPrimary)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 12)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(maxHeight: .infinity)
        }
        .border(isSelected ? .textPrimary : .strokeSecondary)
        .background(isSelected ? .greyBackground : .clear)
        .padding(.top, !isTrial ? 15 : 0)
    }
}

#Preview {
    PurchaseButton(title: "Quarterly Quarterly Quarterly Quarterly Quarterly Quarterly", description: "billed quarterly", price: "$59.99", isTrial: true, isSelected: .constant(true))
}
