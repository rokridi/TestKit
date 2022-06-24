//
//  ViewControllerWIthPageIndicator.swift
//  LBCTestKitDemo
//
//  Created by Aliou SARR on 02/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithPageIndicator: UIViewController {

    private lazy var containerController: UIViewController = {
        let controller = UIViewController()
        controller.view.backgroundColor = .red
        return controller
    }()

    private lazy var pageControl: UIPageControl =  {
        let pageControl = UIPageControl()
        pageControl.accessibilityIdentifier = "pageControlIdentifier"
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 3
        pageControl.currentPage = 1
        pageControl.addTarget(self, action: #selector(updatePageIndex), for: .valueChanged)
        return pageControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.containerController.view)

        self.addChild(self.containerController)
        self.view.addSubview(self.containerController.view)
        self.containerController.didMove(toParent: self)

        self.createPageIndicator()
        self.updatePageIndex()
    }

    private func createPageIndicator() {
        self.view.addSubview(self.pageControl)
        self.pageControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.pageControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
    }

    @objc private func updatePageIndex() {
        switch self.pageControl.currentPage {
        case 0:
            self.containerController.view.backgroundColor = .red
        case 1:
            self.containerController.view.backgroundColor = .blue
        case 2:
            self.containerController.view.backgroundColor = .green
        default:
            break
        }
    }

}
