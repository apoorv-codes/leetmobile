//
//  ProblemListModel.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 1/10/25.
//

import Foundation
import SwiftUI


// MARK: - ProblemsListModel
struct ProblemsListModel: Decodable {
    // MARK: - Datastruct
    struct Datastruct: Decodable {
        let problemsetQuestionList: ProblemsetQuestionList?
    }
    
    // MARK: - ProblemsetQuestionList
    struct ProblemsetQuestionList: Decodable {
        let total: Int?
        let questions: [Question]?
    }

    let data: Datastruct?
}

// MARK: - Question
@Observable
class Question: Identifiable, Decodable {
    let acRate: Double?
    let difficulty: Difficulty?
    let frontendQuestionID: String?
    let isFavor, paidOnly: Bool?
    let title, titleSlug: String?
    let topicTags: [TopicTag]?
    let hasSolution, hasVideoSolution: Bool?

    enum CodingKeys: String, CodingKey {
        case acRate, difficulty
        case frontendQuestionID = "frontendQuestionId"
        case isFavor, paidOnly, title, titleSlug, topicTags, hasSolution, hasVideoSolution
    }
}

enum Difficulty: String, Decodable {
    case easy = "Easy"
    case hard = "Hard"
    case medium = "Medium"
    
    var color: Color {
        switch self {
        case .easy:
            return .green
        case .medium:
            return .yellow
        case .hard:
            return .red
        }
    }
}

// MARK: - TopicTag
@Observable
class TopicTag: Identifiable, Decodable {
    let name, id, slug: String?
}
