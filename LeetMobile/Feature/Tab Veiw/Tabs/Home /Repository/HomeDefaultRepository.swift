//
//  HomeDefaultRepository.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//

import Combine

final class HomeDefaultRepository: HomeRepositoryProtocol {
    let remoteRepository: HomeRemoteRepositoryProtocol
    
    init(remoteRepository: HomeRemoteRepositoryProtocol) {
        self.remoteRepository = remoteRepository
    }
    
    func fetchHome(userId: String) -> AnyPublisher<UserProfileModel, Error> {
        remoteRepository.fetchHome(userId: userId)
    }
}
