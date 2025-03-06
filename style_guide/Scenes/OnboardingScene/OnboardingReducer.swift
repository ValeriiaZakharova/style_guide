//
//  OnboardingReducer.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 02.03.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct OnboardingViewReducer {

    @Reducer(state: .equatable)
    enum Destination {
        case quizFocus(QuizFocusReducer)
    }

    @ObservableState
    struct State: Equatable {
        var currentPage = 0
        var onboardingData = [
            OnboardingViewModel(
                title: "Your Personal Stylist",
                subtitle: "who matches you perfectly",
                image: Image(.onboarding1)),
            OnboardingViewModel(
                title: "Curated outfits",
                subtitle: "of high quality and multiple brands",
                image: Image(.onboarding2)),
            OnboardingViewModel(
                title: "Weekly Outfit Selections",
                subtitle: "hand-picked by your stylist",
                image: Image(.onboarding3))
        ]

        @Presents var destination: Destination.State?
    }

    enum Action: BindableAction {
        case pageChanged(Int)
        case redirectUser
        case terms
        case privacy
        case binding(BindingAction<State>)
        case destination(PresentationAction<Destination.Action>)
    }

    @Dependency(\.dismiss)
    private var dismiss

    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .pageChanged(let index):
                state.currentPage = index
                return .none
            case .redirectUser:
                state.destination = .quizFocus(QuizFocusReducer.State())
                return .none
            case .terms:
                // Action to open terms
                return .none
            case .privacy:
                // action to open privacy
                return .none
            case .binding:
                return .none
            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
    }
}
