//
//  OnboardingView.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 02.03.2025.
//

import SwiftUI
import ComposableArchitecture

struct OnboardingView: View {

    @Perception.Bindable var store: StoreOf<OnboardingViewReducer>

    var body: some View {
        NavigationStack {
            VStack(spacing: .zero) {
                VStack(spacing: 16) {
                    TabView(selection: $store.currentPage) {
                        ForEach(store.onboardingData.indices, id: \.self) { index in
                            VStack(spacing: .zero) {
                                Text(store.onboardingData[index].title)
                                    .font(.kExtraBold28)
                                    .foregroundStyle(.textPrimary)
                                Text(store.onboardingData[index].subtitle)
                                    .font(.kBolt20)
                                    .foregroundStyle(.textPrimary)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 45)
                                store.onboardingData[index].image
                                    .resizable()
                                    .scaledToFit()
                            }
                            .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .onChange(of: store.currentPage) { newPage in
                        store.send(.pageChanged(newPage))
                    }
                    PageControl(currentPage: $store.currentPage, numberOfPages: store.onboardingData.count)
                        .padding(.bottom, 20)
                }
                Spacer()
                MainButtonView(
                    title: "Take a Quiz",
                    color: .black) {
                        store.send(.redirectUser)
                }
                .padding(.bottom, 16)
                AttributedTextView(
                    fullText: "By tapping Get started or I already have an account, you agree to our Terms of Use and Privacy Policy.",
                    firstPart: "Terms of Use",
                    secondPart: "Privacy Policy",
                    firstAction: {
                        store.send(.terms)
                    },
                    secondAction: {
                        store.send(.privacy)
                    }
                )
                .frame(height: 50)
                .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(.white)
            .navigationDestination(
                item: $store.scope(state: \.destination?.quizFocus, action: \.destination.quizFocus)
            ) { store in
                QuizFocusView(store: store)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    OnboardingView(store: Store(initialState: OnboardingViewReducer.State(), reducer: {
        OnboardingViewReducer()
    }))
}
