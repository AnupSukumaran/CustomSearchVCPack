//
//  CustomSearchController+Ext.swift
//  CustomSearchBar
//
//  Created by Manu Puthoor on 18/02/20.
//  Copyright © 2020 Appcoda. All rights reserved.
//

import UIKit

extension CustomSearchController: UISearchBarDelegate {
    
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        customSearchBar.showsCancelButton = true
        customDelegate.didStartSearching()
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        customSearchBar.resignFirstResponder()
        customDelegate.didTapOnSearchButton()
    }
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        customSearchBar.resignFirstResponder()
        customSearchBar.showsCancelButton = false
        customDelegate.didTapOnCancelButton()
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        customDelegate.didChangeSearchText(searchText: searchText)
    }
    
}
