//
//  QuestionViewModel.swift
//  SwiftUI REST API
//
//  Created by Bis  on 22/05/24.
//

import Foundation

class QuestionViewModel {
    var task: Task<Void, Error>?
    func getQuestionFromApi(into modelData: QuestionModelData) async {
        task = Task {
            defer {
                task = nil
            }
            do {
                modelData.question = try await ApiManagerQuestion.getQuestion()
            } catch {
                print(error)
                modelData.question = nil
            }
        }
    }
}
