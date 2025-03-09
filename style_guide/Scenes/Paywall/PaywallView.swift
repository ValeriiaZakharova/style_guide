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

    let columns: [GridItem] =  [
        GridItem(.flexible(), spacing: 12, alignment: .bottom),
        GridItem(.flexible(), spacing: 12, alignment: .bottom),
        GridItem(.flexible(), spacing: 12, alignment: .bottom)
    ]

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                Text("Unlock Premium")
                    .font(.largeTitle)
                    .padding()
                LazyVGrid(columns: columns, alignment: .center) {
                    ForEach(viewStore.products) { product in
                        PurchaseHotButton(
                            title: product.title,
                            description: product.description,
                            price: product.price,
                            isSelected: product.isSelected,
                            isTrial: product.isTrial) {
                                
                            }
                    }
                }
            }
            .onAppear {
                viewStore.send(.fetchProducts)
            }
            .padding()
        }
    }
}

#Preview {
    PaywallView(store: Store(initialState: PaywallReducer.State(), reducer: {
        PaywallReducer()
    }))
}
