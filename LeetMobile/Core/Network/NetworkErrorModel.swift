import Foundation

struct NetworkErrorModel: Decodable {
	let error: String
	let code: Int
}
