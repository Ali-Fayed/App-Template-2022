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
        viewModel.homeViewDelegate?.updateViewWithMoreData(indexPaths: indexPaths)
    }
}
