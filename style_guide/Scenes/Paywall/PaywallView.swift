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

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                Text("Unlock Premium")
                    .font(.largeTitle)
                    .padding()
                ForEach(viewStore.products) { product in
                    Button(action: {
                        
                    }) {
                        Text("\(product.title) - \(product.price)")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
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
