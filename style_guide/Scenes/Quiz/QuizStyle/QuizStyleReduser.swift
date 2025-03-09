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
        var quizStyleData: [QuizStyleViewModel] = []
        let title = "Which style best represents you?"
        @PresentationState var quizColor: QuizColorReducer.State?
    }

    enum Action: BindableAction {
        case getData
        case toggleSelection(id: UUID)
        case updateRepository
        case redirect
        case dismiss
        case binding(BindingAction<State>)
        case quizColor(PresentationAction<QuizColorReducer.Action>)
    }

    @Dependency(\.dismiss)
    private var dismiss
    
    @Dependency(\.quizRepository)
    private var quizRepository

    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .getData:
                state.quizStyleData =  QuizStyleViewModel.model.map { styleModel in
                    var newStyleModel = styleModel
                    if quizRepository.getSelectedIds(for: .style).contains(styleModel.title) {
                        newStyleModel.isSelected = true
                    } else {
                        newStyleModel.isSelected = false
                    }
                    return newStyleModel
                }
                return .none
            case .toggleSelection(let id):
                if let index = state.quizStyleData.firstIndex(where: { $0.id == id }) {
                    state.quizStyleData[index].isSelected.toggle()
                }
                return .send(.updateRepository)
            case .updateRepository:
                quizRepository.updateScreenState(for: .style, with: state.quizStyleData.filter{
                    $0.isSelected
                }.map {
                    $0.title
                })
                return .none
            case .redirect:
                state.quizColor = QuizColorReducer.State()
                return .none
            case .dismiss:
                return .run { _ in
                    await dismiss()
                }
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
