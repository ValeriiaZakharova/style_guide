//
//  QuizFocusView.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 06.03.2025.
//

import SwiftUI
import ComposableArchitecture

struct QuizFocusView: View {

    @Perception.Bindable var store: StoreOf<QuizFocusReducer>

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    QuizFocusView(store: Store(initialState: QuizFocusReducer.State(), reducer: {
        QuizFocusReducer()
    }))
}
