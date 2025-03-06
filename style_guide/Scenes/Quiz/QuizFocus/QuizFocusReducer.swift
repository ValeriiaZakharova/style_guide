//
//  QuizFocusReducer.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 05.03.2025.
//

import ComposableArchitecture

@Reducer
struct QuizFocusReducer {
    @Reducer(state: .equatable)
    enum Destination {
        case quizFocus(QuizFocusReducer)
    }

    @ObservableState
    struct State: Equatable {
        @Presents var destination: Destination.State?
    }

    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case destination(PresentationAction<Destination.Action>)
    }

    @Dependency(\.dismiss)
    private var dismiss

    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
    }
}
