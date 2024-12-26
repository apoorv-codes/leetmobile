//
//  UserDetailDefaultRepository.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//

import Combine

final class UserDetailDefaultRepository: UserDetailRepositoryProtocol {
    let remoteRepository: UserDetailRemoteRepositoryProtocol
    
    init(remoteRepository: UserDetailRemoteRepositoryProtocol) {
        self.remoteRepository = remoteRepository
    }
    
    func fetchUserDetail(userId: String) -> AnyPublisher<UsersDataModel, Error> {
        remoteRepository.fetchUserDetail(userId: userId)
    }
}
