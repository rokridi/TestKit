//
//  ViewControllerWithTableView.swift
//  LBCTestKitDemo
//
//  Created by Berangere LATOUCHE on 09/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

enum ViewControllerWithTableViewMode: Equatable {
    case edit(numberOfCells: Int, hasPullToRefresh: Bool)
    case normal(numberOfCells: Int, hasPullToRefresh: Bool)

    var isEdit: Bool {
        switch self {
        case .edit(numberOfCells: _):
            return true
        default:
            return false
        }
    }
}

final class ViewControllerWithTableView: UIViewController {

    private lazy var values: [Int] = {
        return Array(stride(from: 0, to: self.numberOfCells, by: 1))
    }()
    private var canEditTableView: Bool = false

    lazy var tableView: UITableView = UITableView()
    private let numberOfCells: Int

    // Pull to refresh
    private let hasPullToRefresh: Bool

    init(withMode mode: ViewControllerWithTableViewMode) {
        self.canEditTableView = mode.isEdit
        switch mode {
        case .edit(numberOfCells: let value, let hasPullToRefresh),
             .normal(numberOfCells: let value, let hasPullToRefresh):
            self.numberOfCells = value
            self.hasPullToRefresh = hasPullToRefresh

        }
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addTableView()
        if self.hasPullToRefresh {
            self.addPullToRefresh()
        }
    }

    func addTableView() {
        self.tableView.accessibilityIdentifier = "tableViewIdentifier"
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.isEditing = self.canEditTableView
        self.view.addSubview(self.tableView)
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80), // Margin top is required for pullToRefresh (else it takes iPhone's lockscreen interaction)
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

    @objc private func pullToRefresh(sender refreshControl: UIRefreshControl) {
        var nextValue: Int = 0
        if let lastValue = self.values.last {
            nextValue = lastValue + 1
        }
        self.values.append(nextValue)
        refreshControl.endRefreshing()
        self.tableView.reloadData()
    }

    func addPullToRefresh() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.pullToRefresh), for: .valueChanged)
        self.tableView.refreshControl = refreshControl
    }
}

extension ViewControllerWithTableView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.values.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Value: \(self.values[indexPath.row])"
        cell.accessibilityIdentifier = "cell_\(indexPath.row)".lowercased()
        cell.textLabel?.accessibilityIdentifier = "cell_textLabel"
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [
            .init(style: .normal, title: "Action", handler: { _, _, _ in })
        ])
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.values[sourceIndexPath.row]
        self.values.remove(at: sourceIndexPath.row)
        self.values.insert(movedObject, at: destinationIndexPath.row)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.values.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
