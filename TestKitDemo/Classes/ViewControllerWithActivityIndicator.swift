//
//  ViewControllerWithActivityIndicator.swift
//  LBCTestKitDemo
//
//  Created by Poudja.canessane on 13/01/2022.
//  Copyright © 2022 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithActivityIndicator: UIViewController {

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.accessibilityIdentifier = "activityIndicatorIdentifier"
        return activityIndicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.activityIndicator)
        NSLayoutConstraint.activate([
            self.activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        self.activityIndicator.startAnimating()
    }
}
