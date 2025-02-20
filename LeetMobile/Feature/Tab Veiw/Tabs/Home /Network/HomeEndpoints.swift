//
//  HomeEndpoints.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//

import Foundation
import Alamofire

enum HomeEndpoints: GraphQLEndpoint {
    case getHome
}

extension HomeEndpoints {
    var query: String {
        """
        
        """
    }
    
    var variables: [String : Any]? {
        var variables = [String: Any]()
        switch self {
        default: break
        }
        return variables
    }
}
