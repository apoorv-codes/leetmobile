//
//  TabViewCoordinator.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 12/17/24.
//

import Combine
import Resolver

final class TabViewCoordinator: BaseCoordinator {
    var subscriptons = Set<AnyCancellable>()
    let tabViewController = TabViewController(viewModel: Resolver.resolve())
    
    override func start() {
        tabViewController.eventsHandler.sink {
            self.handle($0)
        }.store(in: &subscriptons)
        self.navigationController.pushViewController(tabViewController, animated: true)
    }
}


extension TabViewCoordinator: CoordinatorEventHandler {
    typealias CoordinatorEvent = TabViewCoordinatorEvents
    func handle(_ event: TabViewCoordinatorEvents) {
        switch event {
        case .changeTab(let navigationController):
            break
        }
    }
}
