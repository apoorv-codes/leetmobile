//
//  UserDetailRepositoryProtocol.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//

import Combine

protocol UserDetailRepositoryProtocol {
    func fetchUserDetail(userId: String) -> AnyPublisher<UserProfileModel, Error>
}

protocol UserDetailRemoteRepositoryProtocol {
    func fetchUserDetail(userId: String) -> AnyPublisher<UserProfileModel, Error>
}
