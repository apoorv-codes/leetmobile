//
//  TabViewController.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 12/17/24.
//
import UIKit
import Combine

final class TabViewController: UITabBarController {
    let eventsHandler = PassthroughSubject<TabViewCoordinatorEvents, Never>()
    
    // MARK: Interactor
    protocol Interactor: UITabBarControllerDelegate {
        var delegate: TabBarViewControllerDelegate? { get set }
        var tabItems: [UIViewController] { get set }
    }
    
    // MARK: Properties
    private let homeTab: UITabBarItem = {
        let tabItem = UITabBarItem()
        tabItem.title = "Home"
        tabItem.image = UIImage(systemName: "house")
        tabItem.selectedImage = UIImage(systemName: "house.fill")
        return tabItem
    }()
    private let problemsTab: UITabBarItem = {
        let tabItem = UITabBarItem()
        tabItem.title = "Problems"
        tabItem.image = UIImage(systemName: "apple.terminal")
        tabItem.selectedImage = UIImage(systemName: "apple.terminal.fill")
        return tabItem
    }()
    private let leaderboardTab: UITabBarItem = {
        let tabItem = UITabBarItem()
        tabItem.title = "Leaderboard"
        tabItem.image = UIImage(systemName: "chart.bar")
        tabItem.selectedImage = UIImage(systemName: "chart.bar.fill")
        return tabItem
    }()
    private let searchTab: UITabBarItem = {
        let tabItem = UITabBarItem()
        tabItem.title = "Search"
        tabItem.image = UIImage(systemName: "magnifyingglass")
        tabItem.selectedImage = UIImage(systemName: "magnifyingglass.fill")
        return tabItem
    }()
    
    private let viewModel: Interactor
    
    init(viewModel: any Interactor) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.delegate = viewModel
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.setupTabs()
        
    }
    
    private func setupTabs() {
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = homeTab
        
        let problemsViewController = ProblemsViewController(eventsHandler)
        problemsViewController.tabBarItem = problemsTab
        
        let leaderboardViewController = UIViewController()
        leaderboardViewController.tabBarItem = leaderboardTab
        
        let searchViewController =  UIViewController()
        searchViewController.tabBarItem = searchTab
        
        viewModel.tabItems = [
            homeViewController,
            problemsViewController,
            leaderboardViewController,
            searchViewController
        ]
        viewControllers = viewModel.tabItems
    }
}

extension TabViewController: TabBarViewControllerDelegate {
    func tabDidSwitch(to viewController: UIViewController) {
//        if let tabItem = viewController.tabBarItem {
//            navigationItem.title = tabItem.title
//        }
        
    }
}
