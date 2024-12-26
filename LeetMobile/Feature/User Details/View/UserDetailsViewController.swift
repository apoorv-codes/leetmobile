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
        var userDetailsPublisher: AnyPublisher<UsersDataModel?, Never> { get }
        var isLoadingPublisher: AnyPublisher<Bool, Never> { get }
        func fetchUserDetails(username: String)
    }

    private var viewModel: any Interactor = Resolver.resolve()
    private var subscriptions = Set<AnyCancellable>()
    
    lazy private var helloWorld: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var userImage: LazyImageView = {
        let imageView = LazyImageView()
        imageView.placeholderView = UIActivityIndicatorView()
        imageView.priority = .high
        imageView.pipeline = .shared
        imageView.onCompletion = { _ in print("Request completed") }
        return imageView
    }()
    
    lazy private var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .large)
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.startAnimating()
        return loader
    }()
    
    lazy private var vStack: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [
            loader,
            userImage,
            helloWorld
        ])
        vStack.axis = .vertical
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.distribution = .fillProportionally
        vStack.alignment = .center
        return vStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.fetchUserDetails(username: "anubhav0910")
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.viewModel.fetchUserDetails(username: "apoorvverma812")
            
        }
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(vStack)
        self.setUpConstraints()
        self.setupBindings()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupBindings() {
            viewModel.userDetailsPublisher
                .map { "Hello, \($0?.name ?? "User")" }
                .assign(to: \.text, on: helloWorld)
                .store(in: &subscriptions)

            viewModel.userDetailsPublisher
                .compactMap { URL(string: $0?.avatar ?? "") }
                .assign(to: \.url, on: userImage)
                .store(in: &subscriptions)

            viewModel.isLoadingPublisher
                .map { !$0 }
                .assign(to: \.isHidden, on: loader)
                .store(in: &subscriptions)
        }
}
