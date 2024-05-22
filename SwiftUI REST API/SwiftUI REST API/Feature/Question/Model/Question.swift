//
//  Question.swift
//  SwiftUI REST API
//
//  Created by Bis  on 22/05/24.
//

import Foundation

struct QuestionWrapper: Codable {
    let items: [Question]
}

struct Question: Codable {
    let score: Int
    let title: String
}
