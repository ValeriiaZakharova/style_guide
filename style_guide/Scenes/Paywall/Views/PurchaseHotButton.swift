//
//  PurchaseHotButton.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 09.03.2025.
//

import SwiftUI

struct PurchaseHotButton: View {

    let title: String
    let description: String
    let price: String
    var isSelected: Bool
    let isTrial: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
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
                        if !isTrial {
                            Text(price)
                                .font(.pRegular16)
                                .foregroundColor(.textPrimary)
                        }
                    }
                    Spacer()
                    Text(description)
                        .font(.pLight14)
                        .foregroundColor(.textPrimary)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 12)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .border(isSelected ? .textPrimary : .strokeSecondary)
        .background(isSelected ? .greyBackground : .clear)
        .padding(.top, !isTrial ? 15 : 0)
    }
}

#Preview {
    PurchaseHotButton(title: "Quarterly", description: "billed quarterly", price: "$59.99", isSelected: true, isTrial: true) {
        
    }
}
