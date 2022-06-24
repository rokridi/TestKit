//
//  ViewControllerWithToolbar.swift
//  LBCTestKitDemo
//
//  Created by Aliou SARR on 03/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithToolbar: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.createToolbar()
    }

    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.backgroundColor = UIColor.orange
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.accessibilityIdentifier = "toolbarIdentifier"
        self.view.addSubview(toolbar)

        toolbar.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        toolbar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        toolbar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true

        let button = UIBarButtonItem(title: "bouton", style: .plain, target: self, action: #selector(actionTap(_:)))
        button.accessibilityIdentifier = "toolbarButtonIdentifier"
        toolbar.setItems([button], animated: false)
    }

    @objc func actionTap(_ sender: UIBarButtonItem) {
        sender.title = "pressed"
    }
}
