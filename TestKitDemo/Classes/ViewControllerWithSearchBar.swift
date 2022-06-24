//
//  ViewControllerWithSearchBar.swift
//  LBCTestKitDemo
//
//  Created by Vincent DOUANT on 12/08/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithSearchBar: UIViewController {

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.accessibilityIdentifier = "searchBarIdentifier"
        return searchBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addSearchBar()
    }

    private func addSearchBar() {
        self.view.addSubview(self.searchBar)
        self.searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.searchBar.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}

extension ViewControllerWithSearchBar: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
