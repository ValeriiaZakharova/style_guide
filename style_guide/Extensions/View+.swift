//
//  View+.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 08.03.2025.
//
import SwiftUI

extension View {

    /// A view modifier that adds a custom toolbar to the view with dynamic title visibility and an action for a back button.
    ///
    /// - Parameters:
    ///   - title: The title text to display in the navigation bar
    ///   - action: Action when the back button is tapped
    /// - Returns: A modified version of the original view with a custom toolbar
    func customToolbar(title: String, hideBackButton: Bool = false, action: @escaping () -> Void) -> some View {
        self
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if !hideBackButton {
                        Button {
                            action()
                        } label: {
                            Image(.chevronBack)
                                .renderingMode(.template)
                                .frame(width: 8, height: 16)
                                .foregroundColor(.textPrimary)
                        }
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.pRegular14)
                        .foregroundColor(.textPrimary)
                }
            }
    }
}
