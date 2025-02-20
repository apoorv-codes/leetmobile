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
    
}
