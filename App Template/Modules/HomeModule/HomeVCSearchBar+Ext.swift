//
//  SearchBar+Ext.swift
//  App Template
//
//  Created by AliFayed on 08/10/2022.
//

import UIKit
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.isSearching = true
        let requestValues = HomeViewRequestValues(page: pageNumber, searchText: searchText)
        viewModel.fetchUsers(requestValues: requestValues)
    }
}
