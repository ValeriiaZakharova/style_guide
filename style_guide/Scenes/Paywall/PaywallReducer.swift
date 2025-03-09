//
//  PaywallReducer.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 09.03.2025.
//

import ComposableArchitecture
import StoreKit

@Reducer
struct PaywallReducer {

    struct State: Equatable {
        var products: [PaywallProductModel] = []
    }

    enum Action: BindableAction {
        case fetchProducts
        case productsResponse(TaskResult<[Product]>)
        case binding(BindingAction<State>)
    }

    @Dependency(\.storeKit)
    private var storeKit

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .fetchProducts:
                return .run { send in
                    await send(
                        .productsResponse(
                            TaskResult { try await storeKit.fetchProducts() }
                        )
                    )
                }
            case .productsResponse(.success(let products)):
                state.products = products.map {
                    PaywallProductModel(id: $0.id, title: $0.displayName, price: $0.displayPrice)
                }
                return .none
            case .binding:
                return .none
            case .productsResponse(.failure(let error)):
                // TODO: Handle error
                return .none
            }
        }
    }
}
