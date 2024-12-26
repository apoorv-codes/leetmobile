//
//  UserDetailCoordinator.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/4/24.
//

final class UserDetailCoordinator: BaseCoordinator {
    override func start() {
        let userDetailsViewController = UserDetailsViewController()
        self.navigationController.pushViewController(userDetailsViewController, animated: true)
    }
}

extension UserDetailCoordinator: CoordinatorEventHandler {
    typealias CoordinatorEvent = UserDetailCoordinatorEvents
    
    func handle(_ event: UserDetailCoordinatorEvents) {
        switch event {
        default: break
        }
    }
}
