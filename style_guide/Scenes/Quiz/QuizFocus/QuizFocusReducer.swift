//
//  QuizFocusReducer.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 05.03.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct QuizFocusReducer {

    struct State: Equatable {
        var quizFocusData: [QuizFocusViewModel] = QuizFocusViewModel.models
    }

    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case toggleSelection(id: UUID)
    }

    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            case .toggleSelection(let id):
                if let index = state.quizFocusData.firstIndex(where: { $0.id == id }) {
                    state.quizFocusData[index].isSelected.toggle()
                }
                return .none
            }
        }
    }
}
