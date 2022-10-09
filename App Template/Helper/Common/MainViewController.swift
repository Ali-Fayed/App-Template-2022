//
//  MainViewController.swift
//  App Template
//
//  Created by AliFayed on 08/10/2022.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    let refreshControl = UIRefreshControl()
    let searchController = UISearchController()
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    var pageNumber = 1
    var prefetchIndex = 15
    var isError = false
    func initActivityIndicator() {
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
   }
    func searchText() -> String {
        guard let searchText = searchController.searchBar.text else { return "" }
        return searchText
    }
    func filterdSearchText() -> String  {
        let filterdSearchText = searchText().filter { $0.isLetter || $0.isNumber }
        return filterdSearchText
    }
    func initTableViewConfigs<cell: UITableViewCell>(tableView: UITableView, rowHeight: CGFloat, cellClass: cell.Type) {
        tableView.rowHeight = rowHeight
        tableView.registerCellNib(cellClass: cellClass)
        refreshControl.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    @objc func refreshTableView(refreshControl: UIRefreshControl) {
        // do some action
        refreshControl.endRefreshing()
    }
    func initSearchController(delegate: UISearchBarDelegate, placeHolder: String) {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = true
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.delegate = delegate
        searchController.searchBar.placeholder = placeHolder
        navigationItem.searchController = searchController
    }
    func tableViewFooterActivityIndicator() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let activityIndicator = UIActivityIndicatorView()
        footerView.addSubview(activityIndicator)
        activityIndicator.center = footerView.center
        activityIndicator.startAnimating()
        return activityIndicator
    }
    func presentRequestErrorAlert(error: Error) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.presentAlert(title: "Error", message: "Request failed with error: \(error)", btnTitle: "Ok")
            self.isError = true
        }
    }
    func reloadTableView(tableView: UITableView) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.activityIndicator.stopAnimating()
            tableView.reloadData()
        }
    }
    func usersDataRequestValues() -> HomeViewRequestValues {
        let requestValues = HomeViewRequestValues(page: pageNumber, searchText: Constants.searchWord)
        return requestValues
    }
}
