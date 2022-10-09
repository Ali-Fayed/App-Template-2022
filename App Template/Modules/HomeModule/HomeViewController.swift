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
        initView()
        initViewModel()
    }
    // MARK: - UI Methods
    func initView() {
        initTableViewConfigs(tableView: tableView, rowHeight: 50, cellClass: UsersTableViewCell.self)
        initSearchController(delegate: self, placeHolder: Constants.searchUsersPlaceholder)
        initActivityIndicator()
        viewModel.homeViewDelegate = self
    }
    @objc override func refreshTableView(refreshControl: UIRefreshControl) {
        viewModel.homeViewDelegate?.refreshView()
    }
    // MARK: - Data Methods
    func initViewModel() {
        viewModel.fetchUsers(requestValues: usersDataRequestValues())
    }
}
