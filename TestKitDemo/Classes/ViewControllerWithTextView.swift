//
//  ViewControllerWithTextView.swift
//  LBCTestKitDemo
//
//  Created by Aliou SARR on 16/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithTextView: UIViewController {

    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.white
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.accessibilityIdentifier = "textViewIdentifier"
        textView.backgroundColor = .lightGray
        return textView
    }()

    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.addTextView()
    }

    private func addTextView() {
        self.view.addSubview(self.textView)
        textView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

    }
}
