//
//  TopView.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 09.03.2025.
//

import SwiftUI

struct TopView: View {

    let title: String
    let subtitle: String

    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.kBolt26)
                .foregroundStyle(.textPrimary)
            Text(subtitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.pLight13)
                .foregroundStyle(.textPrimary)
        }
    }
}

#Preview {
    TopView(
        title: "What’d you like our stylists to focus on?",
        subtitle: "We offer services via live-chat mode.")
}
