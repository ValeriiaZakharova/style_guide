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
        case toggleSelection(id: String)
        case makePurchase
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
                    PaywallProductModel(id: $0.id, title: $0.displayName, price: $0.displayPrice, description: $0.description, isTrial: $0.id == Constants.trialId, isSelected: $0.id == Constants.trialId)
                }
                .sorted(by: { first, second in
                    let firstIndex = Constants.identifiers.firstIndex(of: first.id) ?? Constants.identifiers.count
                    let secondIndex = Constants.identifiers.firstIndex(of: second.id) ?? Constants.identifiers.count
                    return firstIndex < secondIndex
                })
                return .none
            case .toggleSelection(let id):
                state.products = state.products.map { product in
                    var updatedProduct = product
                    updatedProduct.isSelected = (product.id == id)
                    return updatedProduct
                }
                return .none
            case .makePurchase:
                // TODO: Implement purchase logic, out of the scope
                return .none
            case .binding:
                return .none
            case .productsResponse(.failure(let error)):
                // TODO: Handle error, out of the scope
                return .none
            }
        }
    }
}
