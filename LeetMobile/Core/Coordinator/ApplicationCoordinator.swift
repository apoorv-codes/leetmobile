//
//  ApplicationCoordinator.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/3/24.
//

import Foundation
import Combine
import UIKit

final class ApplicationCoordinator: BaseCoordinator {
    private var window: UIWindow
    private var subscriptions = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    override func start() {
        let rootViewCoordinator = TabViewCoordinator()
        start(coordinator: rootViewCoordinator)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

extension ApplicationCoordinator: CoordinatorEventHandler {
    typealias CoordinatorEvent = ApplicationCoordinatorEvent
    func handle(_ event: ApplicationCoordinatorEvent) {
        switch event {
        default: break
        }
    }
}
