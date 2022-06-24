//
//  ViewControllerWithProgressView.swift
//  LBCTestKitDemo
//
//  Created by Aliou SARR on 02/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithProgressView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.createProgressView()
    }

    func createProgressView() {
        let progressView = UIProgressView()
        progressView.progressTintColor = .orange
        progressView.accessibilityIdentifier = "progressViewIdentifier"
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0.5
        self.view.addSubview(progressView)
        progressView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        progressView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        progressView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
    }
}
