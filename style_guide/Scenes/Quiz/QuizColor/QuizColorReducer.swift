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
        var quizColorData: [QuizColorItemModel] = QuizColorItemModel.model
        let title = "Choose favourite colors"
//        @PresentationState var paywall: PaywallReducer.State?
    }

    enum Action: BindableAction {
        case redirect
        case dismiss
        case binding(BindingAction<State>)
        case toggleSelection(id: UUID)
//        case paywall(PresentationAction<PaywallReducer.Action>)
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

                return .none
            case .toggleSelection(let id):
                if let index = state.quizColorData.firstIndex(where: { $0.id == id }) {
                    state.quizColorData[index].isSelected.toggle()
                }
                return .none
            case .binding:
                return .none
            }
        }
//        .ifLet(\.$paywall, action: \.paywall) {
//            PaywallReducer()
//        }._printChanges()
    }
}

