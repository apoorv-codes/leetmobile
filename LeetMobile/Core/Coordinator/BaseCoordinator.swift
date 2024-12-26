//
//  BaseCoordinator.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/2/24.
//

import Foundation
import UIKit

class BaseCoordinator: NSObject, Coordinator {
    // MARK: Properties
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController = UINavigationController()
    
    // MARK: Initializer
    override init() {
        super.init()
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    func start() {
        fatalError("start() must be implemented by child coordinator")
    }
    
    func start(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.navigationController = navigationController
        coordinator.start()
    }
    
    func dismiss() {
        parentCoordinator?.stop(coordinator: self)
        if let presentedNavigationController = navigationController.presentedViewController as? UINavigationController, presentedNavigationController.presentedViewController != nil {
            presentedNavigationController.presentedViewController?.dismiss(animated: true)
        } else if navigationController.presentationController != nil {
            navigationController.dismiss(animated: true)
        }
    }
    
    func stop() {
        parentCoordinator?.stop(coordinator: self)
        if let presentedNavigationController = navigationController.presentedViewController as? UINavigationController {
            presentedNavigationController.popViewController(animated: true)
        } else {
            navigationController.popViewController(animated: true)
        }
    }
    
    func stop(coordinator: Coordinator) {
        if let coordinatorIndex = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: coordinatorIndex)
        }
    }
}
