//
//  GraphQLRequest.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 12/26/24.
//
import Alamofire
import Foundation

protocol GraphQLEndpoint: Endpoint {
    var query: String { get }
    var variables: [String: Any]? { get }
}

extension GraphQLEndpoint {
    var baseURL: String {
        Constants.baseURL
    }
    
    var path: String {
        "/graphql/"
    }
    
    var httpMethod: HTTPMethod {
        .post
    }
    
    var parameters: Parameters? {
        [
            "query": query,
            "variables": variables ?? [:]
        ]
    }
    
    var headers: HTTPHeaders? {
        [:]
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let completeURL = completeURL else {
            throw APIError.invalidURL
        }
        var urlRequest = URLRequest(url: completeURL)
        urlRequest.httpMethod = httpMethod.rawValue
        headers?.forEach {
            urlRequest.addValue($0.value, forHTTPHeaderField: $0.name)
        }
        return try JSONEncoding.default.encode(urlRequest, with: parameters)
    }
}
