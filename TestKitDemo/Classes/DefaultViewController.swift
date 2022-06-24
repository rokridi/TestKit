//
//  ViewController.swift
//  LBCTestKitDemo
//
//  Created by Luís Figueiredo on 20/04/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import UIKit

final class ItemCell: UICollectionViewCell {

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.addSubview(self.label)
        self.label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setTitle(_ title: String) {
        self.label.text = title
    }
}

final class DefaultViewController: UIViewController {

    private let values: [HomePageType] = HomePageType.allCases

    lazy var collectionViewFlowLayout: UICollectionViewLayout = {
//        let layout: UICollectionViewFlowLayout = .init()
//        layout.itemSize = CGSize(width: 80, height: 80)
        let layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        return layout
    }()

    lazy var collectionView: UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: self.collectionViewFlowLayout)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addCollectionView()
    }

    func addCollectionView() {
        self.collectionView.accessibilityIdentifier = "collectionViewIdentifier"
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(ItemCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionView.backgroundColor = .white
        self.view.addSubview(self.collectionView)
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension DefaultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.values.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: ItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ItemCell else {
            return UICollectionViewCell() }
        cell.accessibilityIdentifier = self.values[indexPath.row].rawValue
        cell.setTitle(self.values[indexPath.row].rawValue)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pageType = self.values[indexPath.row]
        self.showHomeTestPage(pageType: pageType)
    }
}

extension DefaultViewController {
    func showHomeTestPage(pageType: HomePageType) {
        let viewController: UIViewController
        switch pageType {
        case .homePageWithActivityIndicator:
        viewController = ViewControllerWithActivityIndicator()
        case .homePageWithAlert:
            viewController = ViewControllerWithAlert()
        case .homePageWithActionSheet:
            viewController = ViewControllerWithActionSheet()
        case .homePageWithButton:
            viewController = ViewControllerWithButton(text: "C")
        case .homePageWithCollectionView:
            let navigationController = UINavigationController(rootViewController: ViewControllerWithCollectionView())
            viewController = navigationController
        case .homePageWithCustomPickerView:
            viewController = ViewControllerWithCustomPickerView()
        case .homePageWithDatePicker:
            viewController = ViewControllerWithDatePicker()
        case .homePageWithImage:
            viewController = ViewControllerWithImage()
        case .homePageWithLabelA:
            viewController = ViewControllerWithLabel(text: "A")
        case .homePageWithLabelB:
            viewController = ViewControllerWithLabel(text: "B")
        case .homePageWithMap:
            viewController = ViewControllerWithMap()
        case .homePageWithNavigationBar:
            viewController = ViewControllerWithNavigationBar.createController()
        case .homePageWithPageIndicator:
            viewController = ViewControllerWithPageIndicator()
        case .homePageWithPicker:
            viewController = ViewControllerWithPicker(values: ["First", "Second"])
        case .homePageWithProgessView:
            viewController = ViewControllerWithProgressView()
        case .homePageWithScrollView:
            let navigationController = UINavigationController(rootViewController: ViewControllerWithScrollView())
            viewController = navigationController
        case .homePageWithSearchBar:
            viewController = ViewControllerWithSearchBar()
        case .homePageWithSecuredTextField:
            viewController = ViewControllerWithSecuredTextField()
        case .homePageWithSegmentedControl:
            viewController = ViewControllerWithSegmentedControl(values: ["First", "Second"])
        case .homePageWithSlider:
            viewController = ViewControllerWithSlider()
        case .homePageWithStepper:
            viewController = ViewControllerWithStepper()
        case .homePageWithSwitch:
            viewController = ViewControllerWithSwitch()
        case .homePageWithTabBar:
            viewController = ViewControllerWithTabBar()
        case .homePageWithTableViewNormalMode:
            viewController = ViewControllerWithTableView(withMode: .normal(numberOfCells: 6, hasPullToRefresh: false))
        case .homePageWithTableViewEditMode:
            viewController = ViewControllerWithTableView(withMode: .edit(numberOfCells: 6, hasPullToRefresh: false))
        case .homePageWithTableViewScrollableContent:
            viewController = ViewControllerWithTableView(withMode: .normal(numberOfCells: 100, hasPullToRefresh: false))
        case .homePageWithTableViewEmptyPullToRefresh:
            viewController = ViewControllerWithTableView(withMode: .normal(numberOfCells: 0, hasPullToRefresh: true))
        case .homePageWithTableViewPullToRefresh:
            viewController = ViewControllerWithTableView(withMode: .normal(numberOfCells: 2, hasPullToRefresh: true))
        case .homePageWithTextField:
            viewController = ViewControllerWithTextField()
        case .homePageWithTextView:
            viewController = ViewControllerWithTextView()
        case .homePageWithToolbar:
            viewController = ViewControllerWithToolbar()
        case .homePageWithUIControl:
            viewController = ViewControllerWithUIControl()
        case .homePageWithView:
            viewController = ViewControllerWithView()
        case .homePageWithWebView:
            viewController = ViewControllerWithWebView()
        case .homePageWithLink:
            viewController = ViewControllerWithLink()
        }

        self.present(viewController, animated: true)
    }
}


