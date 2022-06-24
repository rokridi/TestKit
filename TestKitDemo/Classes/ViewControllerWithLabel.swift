//
//  ViewControllerA.swift
//  LBCTestKitDemo
//
//  Created by Luís Figueiredo on 21/04/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithLabel: UIViewController {

    let labelText: String

    init(text: String) {
        self.labelText = text
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.addLabelWithText(text: self.labelText)
    }

    func addLabelWithText(text: String) {
        let uilabel = UILabel()
        uilabel.text = text
        uilabel.textColor = .white
        uilabel.font = .systemFont(ofSize: 50)
        uilabel.textAlignment = .center
        self.view.addSubview(uilabel)
        uilabel.translatesAutoresizingMaskIntoConstraints = false

        uilabel.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        uilabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        uilabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        uilabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        uilabel.accessibilityIdentifier = "labelIdentifier"
    }

}
