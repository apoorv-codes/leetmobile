import Foundation
import SwiftUI

enum APIError: Int, Error {
	case invalidURL
    case notConnected
    case csrfTokenNotFound
}

extension APIError: LocalizedError {
	var descriptionText: LocalizedStringKey {
		switch self {
		case .invalidURL:
            return "Invalid URL"
        case .notConnected:
            return "Not Connected"
        case .csrfTokenNotFound:
            return "CSRF Token Not Found"
        }
	}
}
