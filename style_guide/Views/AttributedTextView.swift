//
//  AttributedTextView.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 06.03.2025.
//

import SwiftUI

struct AttributedTextView: UIViewRepresentable {
    var fullText: String
    var firstPart: String
    var secondPart: String
    var firstAction: () -> Void
    var secondAction: () -> Void

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = true
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        
        textView.linkTextAttributes = [
            .foregroundColor: UIColor.textPrimary,
            .font: UIFont.pRegular13,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]

        // Full text
        let attributedString = NSMutableAttributedString(string: fullText)

        if let range = fullText.range(of: firstPart) {
            let nsRange = NSRange(range, in: fullText)
            attributedString.addAttribute(.link, value: "terms", range: nsRange)
        }

        if let range = fullText.range(of: secondPart) {
            let nsRange = NSRange(range, in: fullText)
            attributedString.addAttribute(.link, value: "privacy", range: nsRange)
        }

        let nsRange = NSRange(location: .zero, length: fullText.count)
        attributedString.addAttribute(.foregroundColor, value: UIColor.textSecondary, range: nsRange)
        attributedString.addAttribute(.font, value: UIFont.pRegular13, range: nsRange)

        textView.attributedText = attributedString
        textView.delegate = context.coordinator
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) { }
    
    // Link taps
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: AttributedTextView

        init(parent: AttributedTextView) {
            self.parent = parent
        }

        func textView(_ textView: UITextView, shouldInteractWith url: URL, in characterRange: NSRange) -> Bool {
            if url.absoluteString == "terms" {
                parent.firstAction()
            } else if url.absoluteString == "privacy" {
                parent.secondAction()
            }
            return false
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
}

#Preview {
    AttributedTextView(
        fullText: "By tapping Get started or I already have an account, you agree to our Terms of Use and Privacy Policy.",
        firstPart: "Terms of Use",
        secondPart: "Privacy Policy",
        firstAction: {
            print("Tapped Terms of Use")
        },
        secondAction: {
            print("Tapped Privacy Policy")
        }
    )
}
