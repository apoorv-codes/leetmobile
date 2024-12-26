//
//  UserDetailRepositoryProtocol.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//

import Combine

protocol UserDetailRepositoryProtocol {
    func fetchUserDetail(userId: String) -> AnyPublisher<UsersDataModel, Error>
}

protocol UserDetailRemoteRepositoryProtocol {
    func fetchUserDetail(userId: String) -> AnyPublisher<UsersDataModel, Error>
}
