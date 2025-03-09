//
//  PurchaseManager.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 09.03.2025.
//

import StoreKit
import Dependencies

struct StoreKitClient {

    private let identifiers = [
        "com.style_guide.trial",
        "com.style_guide.quarterly",
        "com.style_guide.lifetime"
    ]

    func fetchProducts() async throws -> [Product] {
        try await Product.products(for: identifiers)
    }
}

extension StoreKitClient: DependencyKey {
    static let liveValue = StoreKitClient()
}

extension DependencyValues {
    var storeKit: StoreKitClient {
        get { self[StoreKitClient.self] }
        set { self[StoreKitClient.self] = newValue }
    }
}
