//
//  QuizRepository.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 09.03.2025.
//

import Dependencies
import SwiftUI

enum ScreenType {
    case style
    case color
    case focus
}

// Sample implementation of the persistence for the selections in quiz.
// Could be implemented as a database or any other persistent storage,
// for the simplicity, selection is kept only in memory
class QuizRepository {
    private var screenStates: [ScreenType: [String]] = [
        .style: [],
        .color: [],
        .focus: []
    ]
    
    func updateScreenState(for screen: ScreenType, with selectedIds: [String]) {
        screenStates[screen] = selectedIds
    }
    
    func getSelectedIds(for screen: ScreenType) -> [String] {
        return screenStates[screen] ?? []
    }
}

extension QuizRepository: DependencyKey {
    static let liveValue = QuizRepository()
}

extension DependencyValues {
    var quizRepository: QuizRepository {
        get { self[QuizRepository.self] }
        set { self[QuizRepository.self] = newValue }
    }
}

