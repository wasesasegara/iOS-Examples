//
//  QuestionsApi.swift
//  SwiftUI REST API
//
//  Created by Bis  on 22/05/24.
//

import Foundation

class ApiManagerQuestion {
    static func getQuestion() async throws -> Question {
        guard let url = URL(string: "https://api.stackexchange.com/2.3/questions?pagesize=1&order=desc&sort=votes&site=stackoverflow&filter=)pe0bT2YUo)Qn0m64ED*6Equ") else {
            throw NSError(domain: "InvalidUrl", code: 0)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder().decode(QuestionWrapper.self, from: data)
        return wrapper.items.first!
    }
}
