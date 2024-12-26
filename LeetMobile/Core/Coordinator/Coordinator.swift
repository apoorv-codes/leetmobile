//
//  Coordinator.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/2/24.
//
import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func start(coordinator: Coordinator)
    func dismiss()
    func stop(coordinator: Coordinator)
    func stop()
}
