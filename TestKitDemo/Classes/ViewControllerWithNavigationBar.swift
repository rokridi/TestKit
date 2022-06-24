//
//  ViewControllerWithNavigationBar.swift
//  LBCTestKitDemo
//
//  Created by Luís Figueiredo on 28/08/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import UIKit

class ViewControllerWithNavigationBar: UIViewController {

    var pageTitle: String

    init(title: String) {
        self.pageTitle = title
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static func createController() -> UINavigationController {
        return UINavigationController(rootViewController: ViewControllerWithNavigationBar(title: "ABC"))
    }

    override func viewDidLoad() {
        self.navigationItem.title = "ABC"
        let button = UIBarButtonItem(title: "action", style: .plain, target: self, action: #selector(actionPressed))
        button.accessibilityIdentifier = "barButtonItemIdentifier"
        self.navigationItem.leftBarButtonItem = button
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.accessibilityIdentifier = "navigationBarIdentifier"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .close)
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "navigationBarButtonIdentifier"
    }

    @objc func actionPressed() {
        self.navigationItem.title = "PRESSED"
    }

}
