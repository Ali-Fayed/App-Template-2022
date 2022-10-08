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
        fetchUsers(page: 1, serachText: searchText)
    }
}
