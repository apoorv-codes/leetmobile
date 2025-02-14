//
//  ProblemsRemoteRepository.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//

import Foundation
import Combine

final class ProblemsRemoteRepository: ProblemsRemoteRepositoryProtocol {
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getProblemsList(for category: String, page: Int) -> AnyPublisher<ProblemsListModel, Error> {
        let request = ProblemsEndpoints.getProblemSetQuestionList(category: category, page: page)
        return networkManager.executeRequest(request, responseType: ProblemsListModel.self)
    }
}
