//
//  MainButtonView.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 06.03.2025.
//

import SwiftUI

struct MainButtonView: View {
    let title: String
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.textPrimaryWhite)
                .font(.pSemiBold16)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(color)
        }
    }
}

#Preview {
    MainButtonView(title: "Get started", color: .blue) { }
}
