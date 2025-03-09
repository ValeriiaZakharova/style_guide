//
//  QuizFocusReducer.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 05.03.2025.
//

import SwiftUI
import ComposableArchitecture

// reducers for the quiz could be generalised and logic could be extracted.
// This was not done in the scope of this sample
@Reducer
struct QuizFocusReducer {

    struct State: Equatable {
        var quizFocusData: [QuizFocusViewModel] = []
        let title = "What’d you like our stylists to focus on?"
        let subtitle = "We offer services via live-chat mode."
        @PresentationState var quizStyle: QuizStyleReducer.State?
    }

    enum Action: BindableAction {
        case getData
        case toggleSelection(id: UUID)
        case updateRepository
        case redirect
        case binding(BindingAction<State>)
        case quizStyle(PresentationAction<QuizStyleReducer.Action>)
    }

    @Dependency(\.quizRepository)
    private var quizRepository

    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .getData:
                state.quizFocusData =  QuizFocusViewModel.model.map { focusModel in
                    var newFocusModel = focusModel
                    if quizRepository.getSelectedIds(for: .focus).contains(focusModel.title) {
                        newFocusModel.isSelected = true
                    } else {
                        newFocusModel.isSelected = false
                    }
                    return newFocusModel
                }
                return .none
            case .toggleSelection(let id):
                if let index = state.quizFocusData.firstIndex(where: { $0.id == id }) {
                    state.quizFocusData[index].isSelected.toggle()
                }
                return .send(.updateRepository)
            case .updateRepository:
                quizRepository.updateScreenState(for: .focus, with: state.quizFocusData.filter{
                    $0.isSelected
                }.map {
                    $0.title
                })
                return .none
            case .redirect:
                state.quizStyle = QuizStyleReducer.State()
                return .none
            case .binding:
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
