//
//  PurchaseManager.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 09.03.2025.
//

import StoreKit
import Dependencies

struct Constants {
    static let trialId = "com.style_guide.trial"
    static let quarterlyId = "com.style_guide.quarterly"
    static let lifetimeId = "com.style_guide.lifetime"
    
    static let identifiers = [
        Constants.trialId,
        Constants.quarterlyId,
        Constants.lifetimeId
    ]
}

struct StoreKitClient {
    func fetchProducts() async throws -> [Product] {
        try await Product.products(for: Constants.identifiers)
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
