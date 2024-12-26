//
//  TabViewCoordinator.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 12/17/24.
//

final class TabViewCoordinator: BaseCoordinator {
    override func start() {
        let tabViewController = TabViewController()
        self.navigationController.pushViewController(tabViewController, animated: true)
    }
}


extension TabViewCoordinator: CoordinatorEventHandler {
    typealias CoordinatorEvent = TabViewCoordinatorEvents
    func handle(_ event: TabViewCoordinatorEvents) {
        switch event {
            
        }
    }
}
