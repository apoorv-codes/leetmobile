//
//  TabViewModel.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 12/17/24.
//

import UIKit
import Combine

protocol TabBarViewControllerDelegate: AnyObject {
    func tabDidSwitch(to viewController: UIViewController)
}

class BounceTabBarTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from),
              let toView = transitionContext.view(forKey: .to) else {
            transitionContext.completeTransition(false)
            return
        }

        let containerView = transitionContext.containerView
        let screenWidth = containerView.bounds.width
        
        // Determine the direction of animation
        let fromIndex = transitionContext.viewController(forKey: .from).flatMap { (vc) -> Int? in
            return (vc.tabBarController?.viewControllers?.firstIndex(of: vc))
        } ?? 0
        
        let toIndex = transitionContext.viewController(forKey: .to).flatMap { (vc) -> Int? in
            return (vc.tabBarController?.viewControllers?.firstIndex(of: vc))
        } ?? 0
        
        let direction: CGFloat = toIndex > fromIndex ? 1 : -1
        let offset = direction * screenWidth
        
        // Position the `toView` off-screen initially
        toView.transform = CGAffineTransform(translationX: offset, y: 0)
        
        containerView.addSubview(toView)
        
        UIView.animateKeyframes(withDuration: transitionDuration(using: transitionContext), delay: 0, options: [], animations: {
            
            // Move both views
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.6) {
                fromView.transform = CGAffineTransform(translationX: -offset, y: 0)
                toView.transform = .identity
            }
            
            // Add bounce effect
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                toView.transform = CGAffineTransform(translationX: (direction * -15), y: 0)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.2) {
                toView.transform = .identity
            }
            
        }, completion: { finished in
            fromView.transform = .identity
            transitionContext.completeTransition(finished)
        })
    }
}
final class TabViewModel: NSObject, ObservableObject, TabViewController.Interactor {
    @Published var selectedTab: Int = 0
    @Published var tabItems: [UIViewController] = []
    
    weak var delegate: TabBarViewControllerDelegate?
    
    init(selectedTab: Int, tabItems: [TabItem]) {
        self.selectedTab = selectedTab
    }
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
        BounceTabBarTransition()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let tabItem = viewController.tabBarItem {
            tabBarController.navigationItem.title = tabItem.title
            
        }
    }
}
