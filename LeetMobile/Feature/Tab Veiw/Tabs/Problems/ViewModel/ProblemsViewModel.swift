//
//  ProblemsViewModel.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 1/7/25.
//

import Combine
import Resolver
import UIKit

@Observable
final class ProblemsViewModel: BaseViewModel {
    // MARK: Properties
    private let repository: ProblemsRepositoryProtocol
    var delegate: ProblemsViewControllerDelegate?
    
    internal var questions: [Question] = []
    
    private var currentPage: Int = 1
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: Initializer
    init(repository: ProblemsRepositoryProtocol) {
        self.repository = repository
    }

    var numberOfRows: Int {
        questions.count
    }
}


extension ProblemsViewModel: ProblemsViewController.Interactor {
    
    func fetchProblemsList() {
        self.setLoadingState(.loading)
        repository.getProblemsList(for: "all-code-essentials", page: currentPage)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.setLoadingState(.loaded)
                case .failure(let failure):
                    self?.setLoadingState(.error)
                    debugPrint("Error: \(failure.localizedDescription)")
                }
                
            } receiveValue: { [weak self] response in
                guard let problems = response.data?.problemsetQuestionList?.questions else {
                    self?.setLoadingState(.error)
                    return
                }
                self?.handelSuccessResponse(list: problems.compactMap{ $0 })
                self?.currentPage += 1
                self?.delegate?.reloadData()
            }
            .store(in: &subscriptions)
        
    }
    
    private func handelSuccessResponse(list response: [Question]) {
        questions += response
    }
}

// MARK: To handel table view events
extension ProblemsViewModel {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProblemCell.identifier) as? ProblemCell else {
            return UITableViewCell()
        }
        cell.setData(question: questions[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == questions.count - 3 {
            fetchProblemsList()
        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }
}
