//
//  TabItems.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 1/27/25.
//
import UIKit

enum TabItem: Int, CaseIterable {
    case home
    case problems
    case leaderboard
    case search
    
    var tabItem: UITabBarItem {
        let tabItem = UITabBarItem()
        tabItem.title = tabName
        tabItem.image = UIImage(systemName: tabImage)
        tabItem.selectedImage = UIImage(systemName: selectedTabImage)
        return tabItem
    }
    
    private var tabName: String {
        switch self {
        case .home:
            "Home"
        case .problems:
            "Problems"
        case .leaderboard:
            "Leaderboard"
        case .search:
            "Search"
        }
    }
    
    private var tabImage: String {
        switch self {
        case .home:
            "house"
        case .problems:
            "apple.terminal"
        case .leaderboard:
            "leaderboard"
        case .search:
            "magnifyingglass"
        }
    }
    
    private var selectedTabImage: String {
        switch self {
        case .home:
            "house.fill"
        case .problems:
            "apple.terminal.fill"
        case .leaderboard:
            "leaderboard.fill"
        case .search:
            "magnifyingglass.fill"
        }
    }
}
