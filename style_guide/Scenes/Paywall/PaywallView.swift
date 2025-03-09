//
//  PaywallView.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 09.03.2025.
//

import SwiftUI
import ComposableArchitecture

struct PaywallView: View {
    let store: StoreOf<PaywallReducer>

    private let columns: [GridItem] =  [
        GridItem(.flexible(), spacing: 12, alignment: .bottom),
        GridItem(.flexible(), spacing: 12, alignment: .bottom),
        GridItem(.flexible(), spacing: 12, alignment: .bottom)
    ]

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ScrollView {
                VStack(spacing: 28) {
                    Image(.hero)
                        .resizable()
                    VStack {
                        HStack(spacing: 4) {
                            ForEach(0..<5, id: \.self) { index in
                                Image(.star)
                                    .frame(width: 16, height: 16)
                            }
                        }
                        VStack(alignment: .center, spacing: 4) {
                            Text("First meeting with a stylist".uppercased())
                                .font(.pRegular16)
                            Text("Tessa caught my style with the first outfit she put together. Although we changed a few things she was great at finding what works for me!")
                                .multilineTextAlignment(.center)
                                .font(.pRegular12)
                                .foregroundStyle(.textSecondary)
                        }
                        .padding(.horizontal, 30)
                    }
                    VStack(spacing: 20) {
                        LazyVGrid(columns: columns, alignment: .center) {
                            ForEach(viewStore.products) { product in
                                PurchaseButton(
                                    title: product.title,
                                    description: product.description,
                                    price: product.price,
                                    isTrial: product.isTrial,
                                    isSelected: Binding(
                                        get: { product.isSelected },
                                        set: { _ in
                                            viewStore.send(.toggleSelection(id: product.id))
                                        }
                                    ))
                            }
                        }
                        Text("Auto-renewable. Cancel anytime.")
                            .font(.pLight13)
                            .foregroundStyle(.textSecondary)
                        VStack {
                            MainButtonView(title: "Continue".uppercased()) {
                                store.send(.makePurchase)
                            }
                            // TODO: Define valid links. Out of scope
                            HStack(spacing: 4) {
                                Text("[Terms of Use](https://www.google.com)")
                                    .underline()
                                Text("|")
                                Text("[Privacy Policy](https://www.google.com)")
                                    .underline()
                            }
                            .tint(.textSecondary)
                                .font(.pLight13)
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .onAppear {
                    viewStore.send(.fetchProducts)
                }
            }
            .ignoresSafeArea(.container, edges: .top)
        }
    }
}

#Preview {
    PaywallView(store: Store(initialState: PaywallReducer.State(), reducer: {
        PaywallReducer()
    }))
}
