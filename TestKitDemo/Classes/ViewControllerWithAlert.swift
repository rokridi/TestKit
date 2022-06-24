//
//  ViewControllerWithAlert.swift
//  LBCTestKitDemo
//
//  Created by Luís Figueiredo on 31/08/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithAlert: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let alert = UIAlertController(title: "Title ABC", message: "message CBA", preferredStyle: .alert)
        alert.view.accessibilityIdentifier = "alertIdentifier"
        alert.addAction(UIAlertAction(title: "Action 1", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Action 2", style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
}
