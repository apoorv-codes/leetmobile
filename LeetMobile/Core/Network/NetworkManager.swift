import Foundation
import Alamofire
import Combine

protocol NetworkManagerProtocol {
	var session: Session { get set }
	func executeRequest(_ request: URLRequestConvertible) -> AnyPublisher<Data, Error>
	func executeRequest<T: Decodable>(_ request: URLRequestConvertible, responseType: T.Type) -> AnyPublisher<T, Error>
}

final class NetworkManager: NetworkManagerProtocol {
	
	internal var session: Session
	
	private lazy var decoder: JSONDecoder = {
		return JSONDecoder()
	}()
	
	init(session: Session) {
		self.session = session
	}
	
	func executeRequest<T>(_ request: URLRequestConvertible, responseType: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
		executeRequest(request)
			.decode(type: T.self, decoder: decoder)
			.eraseToAnyPublisher()
	}
	
	func executeRequest(_ request: URLRequestConvertible) -> AnyPublisher<Data, Error> {
		session.request(request)
			.validate()
			.publishData()
			.tryMap { response in
				guard let data = response.data else {
					throw APIError.notConnected
				}
				
				let errorModel = try? self.decoder.decode(NetworkErrorModel.self, from: data)
				if let errorCode = errorModel?.code, let error = APIError(rawValue: errorCode) {
					throw error
				} else {
					return data
				}
			}
			.eraseToAnyPublisher()
	}
}
