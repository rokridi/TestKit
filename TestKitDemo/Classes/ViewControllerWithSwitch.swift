//
//  ViewControllerWithSwitch.swift
//  LBCTestKitDemo
//
//  Created by Aliou SARR on 28/01/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithSwitch: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addSwitch()
    }

    func addSwitch() {
        let uiswitch = UISwitch()
        uiswitch.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(uiswitch)
        uiswitch.accessibilityIdentifier = "switchIdentifier"
        uiswitch.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        uiswitch.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

}
