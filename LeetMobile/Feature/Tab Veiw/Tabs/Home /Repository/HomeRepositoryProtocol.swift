//
//  HomeRepositoryProtocol.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//

import Combine

protocol HomeRepositoryProtocol {
    func fetchHome(userId: String) -> AnyPublisher<UserProfileModel, Error>
}

protocol HomeRemoteRepositoryProtocol {
    func fetchHome(userId: String) -> AnyPublisher<UserProfileModel, Error>
}
