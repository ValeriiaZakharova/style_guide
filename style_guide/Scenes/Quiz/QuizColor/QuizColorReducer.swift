//
//  QuizColorReducer.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 09.03.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct QuizColorReducer {

    struct State: Equatable {
        var quizColorData: [QuizColorViewModel] = []
        let title = "Choose favourite colors"
        @PresentationState var paywall: PaywallReducer.State?
    }

    enum Action: BindableAction {
        case getData
        case toggleSelection(id: UUID)
        case updateRepository
        case redirect
        case dismiss
        case binding(BindingAction<State>)
        case paywall(PresentationAction<PaywallReducer.Action>)
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
                state.quizColorData =  QuizColorViewModel.model.map { colorModel in
                    var newColorModel = colorModel
                    if quizRepository.getSelectedIds(for: .color).contains(colorModel.title) {
                        newColorModel.isSelected = true
                    } else {
                        newColorModel.isSelected = false
                    }
                    return newColorModel
                }
                return .none
            case .toggleSelection(let id):
                if let index = state.quizColorData.firstIndex(where: { $0.id == id }) {
                    state.quizColorData[index].isSelected.toggle()
                }
                return .send(.updateRepository)
            case .updateRepository:
                quizRepository.updateScreenState(for: .color, with: state.quizColorData.filter{
                    $0.isSelected
                }.map {
                    $0.title
                })
                return .none
            case .redirect:
                state.paywall = PaywallReducer.State()
                return .none
            case .dismiss:
                return .run { _ in
                    await dismiss()
                }
            case .binding:
                return .none
            case .paywall:
                return .none
            }
        }
        .ifLet(\.$paywall, action: \.paywall) {
            PaywallReducer()
        }._printChanges()
    }
}

