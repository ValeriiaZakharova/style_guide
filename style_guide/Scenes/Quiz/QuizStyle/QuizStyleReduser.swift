//
//  QuizStyleReduser.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 08.03.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct QuizStyleReducer {

    struct State: Equatable {
        var quizStyleData: [QuizStyleItemModel] = QuizStyleItemModel.model
        let title = "Which style best represents you?"
        @PresentationState var quizColor: QuizColorReducer.State?
    }

    enum Action: BindableAction {
        case redirect
        case dismiss
        case binding(BindingAction<State>)
        case toggleSelection(id: UUID)
        case quizColor(PresentationAction<QuizColorReducer.Action>)
    }

    @Dependency(\.dismiss)
    private var dismiss

    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .dismiss:
                return .run { _ in
                    await dismiss()
                }
            case .redirect:
                state.quizColor = QuizColorReducer.State()
                return .none
            case .toggleSelection(let id):
                if let index = state.quizStyleData.firstIndex(where: { $0.id == id }) {
                    state.quizStyleData[index].isSelected.toggle()
                }
                return .none
            case .binding:
                return .none
            case .quizColor:
                return .none
            }
        }
        .ifLet(\.$quizColor, action: \.quizColor) {
            QuizColorReducer()
        }._printChanges()
    }
}
