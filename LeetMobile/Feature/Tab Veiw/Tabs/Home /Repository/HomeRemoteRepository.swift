//
//  HomeRemoteRepository.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//

import Foundation
import Combine

final class HomeRemoteRepository: HomeRemoteRepositoryProtocol {
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchHome(userId: String) -> AnyPublisher<UserProfileModel, Error> {
        let requestModel = HomeEndpoints.getHomes(username: userId)
        return networkManager.executeRequest(requestModel, responseType: UserProfileModel.self)
    }
}
