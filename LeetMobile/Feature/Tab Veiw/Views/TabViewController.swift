//
//  TabViewController.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 12/17/24.
//
import UIKit

final class TabViewController: UITabBarController {
    // MARK: Interactor
    protocol Interactor {
        
    }
    
    // MARK: Properties
    private let homeTab: UITabBarItem = {
        let tabItem = UITabBarItem()
        tabItem.image = UIImage(systemName: "house")
        tabItem.selectedImage = UIImage(systemName: "house.fill")
        return tabItem
    }()
    private let contestTab: UITabBarItem = {
        let tabItem = UITabBarItem()
        tabItem.image = UIImage(systemName: "apple.terminal")
        tabItem.selectedImage = UIImage(systemName: "apple.terminal.fill")
        return tabItem
    }()
    private let leaderboardTab: UITabBarItem = {
        let tabItem = UITabBarItem()
        tabItem.image = UIImage(systemName: "chart.bar")
        tabItem.selectedImage = UIImage(systemName: "chart.bar.fill")
        return tabItem
    }()
    private let searchTab: UITabBarItem = {
        let tabItem = UITabBarItem()
        tabItem.image = UIImage(systemName: "magnifyingglass")
        tabItem.selectedImage = UIImage(systemName: "magnifyingglass.fill")
        return tabItem
    }()
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupTabs()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.setupTabs()
    }
    
    private func setupTabs() {
        let homeViewController = UserDetailsViewController(nibName: nil, bundle: nil)
        homeViewController.tabBarItem = homeTab
        
        let contestViewController = UIViewController(nibName: nil, bundle: nil)
        contestViewController.tabBarItem = contestTab
        
        let leaderboardViewController = UIViewController(nibName: nil, bundle: nil)
        leaderboardViewController.tabBarItem = leaderboardTab
        
        let searchViewController = UIViewController(nibName: nil, bundle: nil)
        searchViewController.tabBarItem = searchTab
        
        self.viewControllers = [homeViewController, contestViewController, leaderboardViewController, searchViewController]
    }
}
