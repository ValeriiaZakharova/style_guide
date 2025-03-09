//
//  QuizStyleView.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 08.03.2025.
//

import SwiftUI
import ComposableArchitecture

struct QuizStyleView: View {

    let store: StoreOf<QuizStyleReducer>
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ScrollView(showsIndicators: false) {
                Text(viewStore.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.kBolt26)
                    .foregroundStyle(.textPrimary)
                    .padding(.bottom, 24)
                GridView(items: viewStore.quizStyleData,
                         columns: [
                            GridItem(.flexible(), spacing: 12),
                            GridItem(.flexible(), spacing: 12)
                         ]) { item in
                             QuizStyleItem(
                                title: item.title,
                                image: item.image,
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
            }.onAppear {
                store.send(.getData)
            }
        }
        .navigationDestination(store: store.scope(state: \.$quizColor, action: \.quizColor)) { store in
            QuizColorView(store: store)
        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    QuizStyleView(store: Store(initialState: QuizStyleReducer.State(), reducer: {
        QuizStyleReducer()
    }))
}
