//
//  HomeVCUpdateViewDelegate+Ext.swift
//  App Template
//
//  Created by AliFayed on 09/10/2022.
//

import Foundation
// MARK: - UpdateViewDelegate
extension HomeViewController: UpdateViewDelegate {
    func updateViewWithData() {
        reloadTableView(tableView: tableView)
    }
    func updateViewWithError(error: Error) {
        presentRequestErrorAlert(error: error)
    }
    func refreshView() {
        if isError { initViewModel() }
        isError = false
        refreshControl.endRefreshing()
    }
    func updateViewWithMoreData(indexPaths: [IndexPath]) {
        for index in indexPaths {
            if index.row == prefetchIndex {
                self.tableView.tableFooterView = tableViewFooterActivityIndicator()
                prefetchIndex = prefetchIndex + 30
                pageNumber = pageNumber + 1
                if filterdSearchText().isEmpty {
                    viewModel.fetchUsers(requestValues: usersDataRequestValues())
                } else {
                    let requestValues = HomeViewRequestValues(page: pageNumber, searchText: filterdSearchText())
                    viewModel.fetchUsers(requestValues: requestValues)
                }
            }
        }
    }
}
