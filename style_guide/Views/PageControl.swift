//
//  PageControl.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 06.03.2025.
//

import SwiftUI

struct PageControl: View {

    @Binding var currentPage: Int
    var numberOfPages: Int


    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                ZStack {
                    if index == currentPage {
                        Circle()
                            .stroke(Color.black, lineWidth: 1)
                            .frame(width: 14, height: 14)
                        
                        Circle()
                            .fill(Color.black)
                            .frame(width: 8, height: 8)
                    } else {
                        Circle()
                            .fill(.inActive)
                            .frame(width: 8, height: 8)
                    }
                }
                .onTapGesture {
                    currentPage = index
                }
            }
        }
    }
}

#Preview {
    PageControl(currentPage: .constant(1), numberOfPages: 3)
}
