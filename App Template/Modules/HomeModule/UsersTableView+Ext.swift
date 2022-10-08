//
//  UsersTableView+Ext.swift
//  App Template
//
//  Created by AliFayed on 08/10/2022.
//

import UIKit
// MARK: - TableView
extension HomeViewController: UITableViewDataSource, UITableViewDelegate, UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.usersCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as UsersTableViewCell
        cell.setData(data: viewModel.githubUsers(index: indexPath))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        fetchMoreUsers(indexPaths: indexPaths)
    }
    func fetchMoreUsers(indexPaths: [IndexPath]) {
        for index in indexPaths {
            if index.row == prefetchIndex {
                self.tableView.tableFooterView = tableViewFooterActivityIndicator()
                prefetchIndex = prefetchIndex + 30
                pageNumber = pageNumber + 1
                if filterdSearchText().isEmpty {
                    fetchUsers(page: pageNumber, serachText: "Ali")
                } else {
                    fetchUsers(page: pageNumber, serachText: filterdSearchText())
                }
            }
        }
    }
}
