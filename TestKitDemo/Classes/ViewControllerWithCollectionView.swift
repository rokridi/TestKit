//
//  ViewControllerWithCollectionView.swift
//  LBCTestKitDemo
//
//  Created by Berangere LATOUCHE on 11/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

fileprivate struct CellAttributes {
    let title: String
    let color: UIColor
}

final class ViewControllerWithCollectionView: UIViewController {

    private var values: [CellAttributes] = [
        .init(title: "Zero", color: .black),
        .init(title: "One", color: .blue),
        .init(title: "Two", color: .red),
        .init(title: "Three", color: .purple),
        .init(title: "Four", color: .yellow),
        .init(title: "Five", color: .brown)
    ]

    lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout: UICollectionViewFlowLayout = .init()
        layout.itemSize = CGSize(width: 80, height: 80)
        return layout
    }()

    lazy var collectionView: UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: self.collectionViewFlowLayout)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addCollectionView()
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        self.collectionView.refreshControl = refreshControl
    }

    @objc
    private func pullToRefresh() {
        self.values.insert(.init(title: "New_Zero", color: .green), at: 0)
        self.collectionView.reloadData()
        self.collectionView.refreshControl?.endRefreshing()
    }

    func addCollectionView() {
        self.collectionView.accessibilityIdentifier = "collectionViewIdentifier"
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.dragDelegate = self
        self.collectionView.dropDelegate = self
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionView.backgroundColor = .white
        self.collectionView.dragInteractionEnabled = true
        self.view.addSubview(self.collectionView)
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewControllerWithCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDragDelegate, UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.values.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = self.values[indexPath.row].color
        cell.accessibilityIdentifier = "cell_\(self.values[indexPath.row].title)"
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}

    func collectionView(_ collectionView: UICollectionView, canEditItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let itemProvider = NSItemProvider(object: "\(indexPath)" as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = self.values[indexPath.row]
        return [dragItem]
    }

    func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSString.self)
    }

    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        var destinationIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            let row = collectionView.numberOfItems(inSection: 0)
            destinationIndexPath = IndexPath(item: row - 1, section: 0)
        }

        if coordinator.proposal.operation == .move {
            self.reorderItems(coordinator: coordinator, destinationIndexPath: destinationIndexPath, collectionView: collectionView)
        }
    }

    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        if collectionView.hasActiveDrag {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
    }

    fileprivate func reorderItems(coordinator: UICollectionViewDropCoordinator, destinationIndexPath: IndexPath, collectionView: UICollectionView) {
        if let item = coordinator.items.first,
           let sourceIndexPath = item.sourceIndexPath {
            collectionView.performBatchUpdates({
                self.values.remove(at: sourceIndexPath.row)
                guard let item = item.dragItem.localObject as? CellAttributes else { return }
                self.values.insert(item, at: destinationIndexPath.row)
                collectionView.deleteItems(at: [sourceIndexPath])
                collectionView.insertItems(at: [destinationIndexPath])
            }, completion: nil)
            coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
        }
    }

}
