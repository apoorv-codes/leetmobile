//
//  ProblemsEndpoints.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//

import Foundation
import Alamofire

enum ProblemsEndpoints: GraphQLEndpoint {
    case getProblemSetQuestionList(category: String, page: Int)
}

extension ProblemsEndpoints {
    var query: String {
        switch self {
        case .getProblemSetQuestionList:
            return """
            query problemsetQuestionList($categorySlug: String, $limit: Int, $skip: Int, $filters: QuestionListFilterInput) {
              problemsetQuestionList: questionList(
                categorySlug: $categorySlug
                limit: $limit
                skip: $skip
                filters: $filters
              ) {
                total: totalNum
                questions: data {
                  acRate
                  difficulty
                  freqBar
                  frontendQuestionId: questionFrontendId
                  isFavor
                  paidOnly: isPaidOnly
                  status
                  title
                  titleSlug
                  topicTags {
                    name
                    id
                    slug
                  }
                  hasSolution
                  hasVideoSolution
                }
              }
            }
        """
        }
        
        
    }
    
    var variables: [String : Any]? {
        var variables = [String: Any]()
        switch self {
        case .getProblemSetQuestionList(let categorySlug, let page):
            let defaultPageSize: Int = UserDefaultsHelper.get(forKey: .defaultPageSize) ?? 15
            variables["categorySlug"] = categorySlug
            variables["limit"] = defaultPageSize
            variables["skip"] = defaultPageSize * (page - 1)
            variables["filters"] = [:]
        }
        return variables
    }
}
