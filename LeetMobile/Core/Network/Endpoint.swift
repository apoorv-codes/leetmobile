import Foundation
import Alamofire

protocol Endpoint: URLRequestConvertible {
	var baseURL: String { get }
	var path: String { get }
	var parameters: Parameters? { get }
	var httpMethod: HTTPMethod { get }
	var headers: HTTPHeaders? { get }
}

extension Endpoint {
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
		return try URLEncoding.default.encode(urlRequest, with: parameters)
	}
}
