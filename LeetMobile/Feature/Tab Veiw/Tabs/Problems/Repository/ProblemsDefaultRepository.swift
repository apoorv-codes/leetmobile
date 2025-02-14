//
//  ProblemsDefaultRepository.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//

import Combine

final class ProblemsDefaultRepository: ProblemsRepositoryProtocol {
    
    let remoteRepository: ProblemsRemoteRepositoryProtocol
    
    init(remoteRepository: ProblemsRemoteRepositoryProtocol) {
        self.remoteRepository = remoteRepository
    }
    
    func getProblemsList(for category: String = "", page: Int) -> AnyPublisher<ProblemsListModel, Error> {
        remoteRepository.getProblemsList(for: category, page: page)
    }
}
