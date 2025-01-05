//
//  UserDetailsViewModel.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/9/24.
//

import Combine
import Resolver
import Foundation

class UserDetailsViewModel: UserDetailsViewController.Interactor {
    let repository: UserDetailRepositoryProtocol
    @Published private var userDetails: UserProfileModel?
    @Published private var isLoading: Bool
    
    var userDetailsPublisher: AnyPublisher<UserProfileModel?, Never> {
        $userDetails.eraseToAnyPublisher()
    }
    
    var isLoadingPublisher: AnyPublisher<Bool, Never> {
        $isLoading.eraseToAnyPublisher()
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(repository: UserDetailRepositoryProtocol) {
        self.repository = repository
        self.isLoading = false
    }

    func fetchUserDetails(username: String) {
        self.isLoading = true
        repository.fetchUserDetail(userId: username)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    debugPrint("Error: \(failure.localizedDescription)")
                }
                self?.isLoading = false
            } receiveValue: { [weak self] userDetails in
                self?.userDetails = userDetails
            }
            .store(in: &subscriptions)
    }
}
