//
//  ViewControllerWithActionSheet.swift
//  LBCTestKitDemo
//
//  Created by Jean Di Giovanni on 28/07/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithActionSheet: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let alert = UIAlertController(title: "Title ABC", message: "message CBA", preferredStyle: .actionSheet)
        alert.view.accessibilityIdentifier = "actionSheetIdentifier"
        alert.addAction(UIAlertAction(title: "Action 1", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Action 2", style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
}
