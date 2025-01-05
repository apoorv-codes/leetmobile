//
//  UserDetailsViewController.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/4/24.
//


import UIKit
import Combine
import NukeUI
import Resolver


class UserDetailsViewController: UIViewController {
    protocol Interactor: AnyObject {
        var userDetailsPublisher: AnyPublisher<UserProfileModel?, Never> { get }
        var isLoadingPublisher: AnyPublisher<Bool, Never> { get }
        func fetchUserDetails(username: String)
    }
    
    private var viewModel: any Interactor = Resolver.resolve()
    private var subscriptions = Set<AnyCancellable>()
    
    private let helloWorld: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userImage: LazyImageView = {
        let imageView = LazyImageView()
        imageView.placeholderView = UIActivityIndicatorView()
        imageView.priority = .high
        imageView.pipeline = .shared
        imageView.onCompletion = { _ in print("Request completed") }
        return imageView
    }()
    
    private let loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .large)
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.startAnimating()
        return loader
    }()
    
    private let vStack: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.distribution = .fillProportionally
        vStack.alignment = .center
        return vStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.fetchUserDetails(username: "apoorvverma812")
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(vStack)
        self.setUpConstraints()
        self.setupBindings()
    }
    
    func setUpConstraints() {
        vStack.addArrangedSubviews(loader, userImage, helloWorld)
        
        NSLayoutConstraint.activate([
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupBindings() {
        viewModel.userDetailsPublisher
            .map { "Hello, \($0?.data?.matchedUser?.profile?.realName ?? "User")" }
            .assign(to: \.text, on: helloWorld)
            .store(in: &subscriptions)
        
        viewModel.userDetailsPublisher
            .compactMap { URL(string: $0?.data?.matchedUser?.profile?.userAvatar ?? "") }
            .assign(to: \.url, on: userImage)
            .store(in: &subscriptions)
        
        viewModel.isLoadingPublisher
            .map { !$0 }
            .assign(to: \.isHidden, on: loader)
            .store(in: &subscriptions)
        
        vStack.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(refresh)))
        
        
    }
    
    @objc func refresh() {
        viewModel.fetchUserDetails(username: "apoorvverma812")
    }
}
