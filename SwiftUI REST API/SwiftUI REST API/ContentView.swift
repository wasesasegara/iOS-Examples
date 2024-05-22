//
//  ContentView.swift
//  SwiftUI REST API
//
//  Created by Bis  on 22/05/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(QuestionModelData.self) var modelData
    private var viewModel = QuestionViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            if let question = modelData.question {
                Text(question.title)
                    .font(.title)
                Text("Score: " + question.score.formatted())
            } else {
                Text("No data available")
            }
        }
        .padding()
        .task {
            guard !ProcessInfo.processInfo.isPreviewing else {
                return
            }
            await viewModel.getQuestionFromApi(into: modelData)
        }
    }
}

#Preview {
    let modelData = QuestionModelData()
    modelData.question = question1
    return ContentView()
        .environment(modelData)
}

#Preview("No data") {
    let modelData = QuestionModelData()
    return ContentView()
        .environment(modelData)
}
