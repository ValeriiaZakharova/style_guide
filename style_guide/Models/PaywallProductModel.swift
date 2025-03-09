//
//  PaywallProductModel.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 09.03.2025.
//

import SwiftUI

struct PaywallProductModel: Equatable, Identifiable {
    let id: String
    let title: String
    let price: String
    let description: String
    let isTrial: Bool
    var isSelected: Bool = false
}
