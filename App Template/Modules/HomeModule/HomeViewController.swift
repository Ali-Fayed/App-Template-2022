//
//  HomeViewController.swift
//  Cordinator Pattern Sample
//
//  Created by AliFayed on 08/10/2022.
//

import UIKit
class HomeViewController: MainViewController {
    // MARK: - Props
    let viewModel = HomeViewModel()
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewConfig()
        initViewData()
    }
    // MARK: - UI Methods
    func initViewConfig() {
        initTableViewConfigs(tableView: tableView, rowHeight: 50, cellClass: UsersTableViewCell.self)
        initSearchController(delegate: self, placeHolder: Constants.searchUsersPlaceholder)
        initActivityIndicator()
    }
    @objc override func refreshTableView(refreshControl: UIRefreshControl) {
        // do some action
        if isError {
            initViewData()
        }
        isError = false
        refreshControl.endRefreshing()
    }
    // MARK: - Data Methods
    func initViewData() {
        fetchUsers(page: pageNumber, serachText: Constants.searchWord)
    }
    func fetchUsers(page: Int, serachText: String) {
        Task {
            do {
                try await viewModel.fetchUsers(page: page, searchText: serachText)
                reloadTableView(tableView: tableView)
            } catch {
                presentRequestErrorAlert(error: error)
            }
        }
    }
}
