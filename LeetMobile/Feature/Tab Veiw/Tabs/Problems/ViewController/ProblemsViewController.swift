//
//  ProblemsViewController.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 1/6/25.
//

import UIKit
import Resolver
import Combine

protocol ProblemsViewControllerDelegate: AnyObject {
    func reloadData()
}

class ProblemsViewController: UITableViewController {
    // MARK: Interactor
    protocol Interactor: UITableViewDataSource, UITableViewDelegate {
        var delegate: ProblemsViewControllerDelegate? { get set }
        var numberOfRows: Int { get }
        var questions: [Question] { get }
        func fetchProblemsList()
    }
    
    // MARK: Properties
    let eventsHandler: PassthroughSubject<TabViewCoordinatorEvents, Never>
    private let viewmodel: any Interactor = Resolver.resolve()
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: Initializer
    init(_ eventHanler: PassthroughSubject<TabViewCoordinatorEvents, Never>) {
        self.eventsHandler = eventHanler
        super.init(style: .plain)
        viewmodel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: VC State Management
    override func viewDidLoad() {
        super.viewDidLoad()
        /*applyGradientBackground*/()
        tableView.dataSource = viewmodel
        tableView.delegate = viewmodel
        viewmodel.fetchProblemsList()
        setupTabelView()
    }
    
    private func setupTabelView() {
        tableView.register(ProblemCell.self, forCellReuseIdentifier: ProblemCell.identifier)
    }
}


extension ProblemsViewController: ProblemsViewControllerDelegate {
    func reloadData() {
        tableView.reloadData()
    }
}


extension ProblemsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        // Implement search functionality here
        // You can call a method on your viewModel to filter problems
    }
}
