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
                    VStack(spacing: 8) {
                        Text("What’d you like our stylists to focus on?")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.kBolt26)
                            .foregroundStyle(.textPrimary)
                        Text("We offer services via live-chat mode.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.pLight13)
                            .foregroundStyle(.textPrimary)
                    }
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
            }
        }
        .safeAreaInset(edge: .bottom) {
            MainButtonView(title: "Continue".uppercased()) {
                // Handle continue action
            }
            .padding(.bottom, 20)
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
