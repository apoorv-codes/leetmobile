//
//  UserDetailsEndpoint.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//

import Foundation
import Alamofire

enum UserDetailsEndpoint: Endpoint {
    case getUserDetails(username: String)
}

extension UserDetailsEndpoint {
    var baseURL: String {
        "https://alfa-leetcode-api.onrender.com"
    }
    
    var path: String {
        switch self {
        case .getUserDetails(let username):
            return "/\(username)"
        }
    }
    
    var parameters: Parameters? { nil }
    
    var httpMethod: HTTPMethod { .get }
    
    var headers: HTTPHeaders? { nil }
    
}
