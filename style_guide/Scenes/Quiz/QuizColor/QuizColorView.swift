//
//  QuizColorView.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 09.03.2025.
//

import SwiftUI
import ComposableArchitecture

struct QuizColorView: View {

    let store: StoreOf<QuizColorReducer>
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ScrollView(showsIndicators: false) {
                Text(viewStore.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.kBolt26)
                    .foregroundStyle(.textPrimary)
                    .padding(.bottom, 24)
                GridView(items: viewStore.quizColorData,
                         columns: [
                            GridItem(.flexible(), spacing: 12),
                            GridItem(.flexible(), spacing: 12),
                            GridItem(.flexible(), spacing: 12)
                         ]) { item in
                             QuizColorItem(
                                title: item.title,
                                color: item.color,
                                isSelected: Binding(
                                    get: { item.isSelected },
                                    set: { _ in
                                        viewStore.send(.toggleSelection(id: item.id))
                                    }
                                )
                             )
                             .onTapGesture {
                                 viewStore.send(.toggleSelection(id: item.id))
                             }
                         }
            }
            .safeAreaInset(edge: .bottom) {
                MainButtonView(title: "Continue".uppercased()) {
                    viewStore.send(.redirect)
                }
                .padding(.bottom, 10)
                .background(.bar)
            }
            .customToolbar(title: "Style preferences".uppercased()) {
                viewStore.send(.dismiss)
            }
        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    QuizColorView(store: Store(initialState: QuizColorReducer.State(), reducer: {
        QuizColorReducer()
    }))
}
