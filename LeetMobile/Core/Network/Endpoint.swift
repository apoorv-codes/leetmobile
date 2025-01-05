import Foundation
import Alamofire

enum EncodingType {
    case json
    case url
}

protocol Endpoint: URLRequestConvertible {

    var baseURL: String { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var encodingType: EncodingType { get }
}

extension Endpoint {
    var encodingType: EncodingType { .url }
    
    var completeURL: URL? {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = path
        return urlComponents?.url
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
        switch encodingType {
        case .json:
            return try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .url:
            return try URLEncoding.default.encode(urlRequest, with: parameters)
        }
    }
}
