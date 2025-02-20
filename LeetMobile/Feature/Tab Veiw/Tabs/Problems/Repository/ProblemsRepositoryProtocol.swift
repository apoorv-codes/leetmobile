//
//  ProblemsRepositoryProtocol.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//

import Combine

protocol ProblemsRepositoryProtocol {
    func getProblemsList(for category: String, page: Int) -> AnyPublisher<ProblemsListModel, Error>
}

protocol ProblemsRemoteRepositoryProtocol {
    func getProblemsList(for category: String, page: Int) -> AnyPublisher<ProblemsListModel, Error>
}
