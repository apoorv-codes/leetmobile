//
//  UserDetailRemoteRepository.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//

import Foundation
import Combine

final class UserDetailRemoteRepository: UserDetailRemoteRepositoryProtocol {
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchUserDetail(userId: String) -> AnyPublisher<UserProfileModel, Error> {
        let requestModel = UserDetailsEndpoints.getUserDetails(username: userId)
        return networkManager.executeRequest(requestModel, responseType: UserProfileModel.self)
    }
}
