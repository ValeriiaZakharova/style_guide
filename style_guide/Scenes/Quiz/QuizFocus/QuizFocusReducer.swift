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
        let title = "What’d you like our stylists to focus on?"
        let subtitle = "We offer services via live-chat mode."
        @PresentationState var quizStyle: QuizStyleReducer.State?
    }

    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case toggleSelection(id: UUID)
        case redirect
        case quizStyle(PresentationAction<QuizStyleReducer.Action>)
    }

    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .toggleSelection(let id):
                if let index = state.quizFocusData.firstIndex(where: { $0.id == id }) {
                    state.quizFocusData[index].isSelected.toggle()
                }
                return .none
            case .binding:
                return .none
            case .redirect:
                state.quizStyle = QuizStyleReducer.State()
                return .none
            case .quizStyle:
                return .none
            }
        }
        .ifLet(\.$quizStyle, action: \.quizStyle) {
            QuizStyleReducer()
        }._printChanges()
    }
}
