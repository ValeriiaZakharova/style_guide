//
//  QuizFocusView.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 06.03.2025.
//

import SwiftUI
import ComposableArchitecture

struct QuizFocusView: View {
    let store: StoreOf<QuizFocusReducer>

    var body: some View {
        NavigationStack {
            WithViewStore(store, observe: { $0 }) { viewStore in
                ScrollView(showsIndicators: false) {
                    TopView(title: viewStore.title,
                            subtitle: viewStore.subtitle)
                    ForEach(viewStore.quizFocusData) { model in
                        QuizFocusItem(
                            title: model.title,
                            subtitle: model.subtitle,
                            isSelected: Binding(
                                get: { model.isSelected },
                                set: { _ in
                                    viewStore.send(.toggleSelection(id: model.id))
                                }
                            )
                        )
                        .onTapGesture {
                            viewStore.send(.toggleSelection(id: model.id))
                        }
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    MainButtonView(title: "Continue".uppercased()) {
                        viewStore.send(.redirect)
                    }
                    .padding(.bottom, 20)
                }
            }
        }
        .navigationDestination(store: store.scope(state: \.$quizStyle, action: \.quizStyle)) { store in
            QuizStyleView(store: store)
        }
        .customToolbar(
            title: "Lifestyle & Interests".uppercased(),
            hideBackButton: true
        ) { }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    QuizFocusView(store: Store(initialState: QuizFocusReducer.State(), reducer: {
        QuizFocusReducer()
    }))
}
