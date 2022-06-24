//
//  ViewController.swift
//  LBCTestKitDemo
//
//  Created by Luís Figueiredo on 20/04/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import UIKit

final class DefaultViewController: UIViewController {
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange

        self.addTableView()
    }

    func addTableView() {
        self.tableView = UITableView()
        self.tableView.backgroundColor = .white
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false

        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}

extension DefaultViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            return self.createTextFieldCell()
        default:
            return self.createTextFieldCell()
        }
    }

    private func createTextFieldCell() -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.accessibilityIdentifier = "abc"
        textfield.backgroundColor = .green
        cell.contentView.addSubview(textfield)

        textfield.topAnchor.constraint(equalTo: cell.contentView.topAnchor).isActive = true
        textfield.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
        textfield.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
        textfield.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true

        return cell
    }
}

extension DefaultViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
