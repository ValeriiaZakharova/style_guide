//
//  OnboardingView.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 02.03.2025.
//

import SwiftUI
import ComposableArchitecture

struct OnboardingView: View {

    let store: StoreOf<OnboardingViewReducer>

    var body: some View {
        NavigationStack {
            WithViewStore(store, observe: { $0 }) { viewStore in
                VStack(spacing: .zero) {
                    VStack(spacing: 16) {
                        TabView(selection: Binding(
                            get: { viewStore.state.currentPage },
                            set: { viewStore.send(.pageChanged($0)) }
                        )) {
                            ForEach(viewStore.onboardingData.indices, id: \.self) { index in
                                VStack(spacing: .zero) {
                                    Text(viewStore.onboardingData[index].title)
                                        .font(.kExtraBold28)
                                        .multilineTextAlignment(.center)
                                        .foregroundStyle(.textPrimary)
                                    Text(viewStore.onboardingData[index].subtitle)
                                        .font(.kBolt20)
                                        .foregroundStyle(.textPrimary)
                                        .multilineTextAlignment(.center)
                                        .padding(.bottom, 45)
                                    viewStore.onboardingData[index].image
                                        .resizable()
                                        .scaledToFit()
                                }
                                .tag(index)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        PageControl(currentPage: Binding(
                            get: { viewStore.state.currentPage },
                            set: { viewStore.send(.pageChanged($0)) }
                        ), numberOfPages: viewStore.onboardingData.count)
                        .padding(.bottom, 20)
                    }
                    Spacer()
                    MainButtonView(
                        title: "Take a Quiz") {
                            viewStore.send(.redirectUser)
                        }
                        .padding(.bottom, 16)
                    AttributedTextView(
                        fullText: "By tapping Get started or I already have an account, you agree to our Terms of Use and Privacy Policy.",
                        firstPart: "Terms of Use",
                        secondPart: "Privacy Policy",
                        firstAction: {
                            viewStore.send(.terms)
                        },
                        secondAction: {
                            viewStore.send(.privacy)
                        }
                    )
                    .frame(height: 70)
                    .multilineTextAlignment(.center)
                }
            }
            .navigationDestination(store: store.scope(state: \.$quizFocus, action: \.quizFocus)) { store in
                QuizFocusView(store: store)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(.white)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    OnboardingView(store: Store(initialState: OnboardingViewReducer.State(), reducer: {
        OnboardingViewReducer()
    }))
}

