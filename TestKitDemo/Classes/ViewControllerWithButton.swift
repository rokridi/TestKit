//
//  ViewControllerWithButton.swift
//  LBCTestKitDemo
//
//  Created by Luís Figueiredo on 28/08/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithButton: UIViewController {

    let buttonText: String
    var button: UIButton?

    init(text: String) {
        self.buttonText = text
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.addButtonWithText(text: self.buttonText)
        self.addDisableButton()
    }

    func addButtonWithText(text: String) {
        let uibutton = UIButton(type: .roundedRect)
        uibutton.setTitle(text, for: .normal)
        uibutton.titleLabel?.textColor = .white
        uibutton.titleLabel?.font = .systemFont(ofSize: 50)
        uibutton.titleLabel?.textAlignment = .center
        uibutton.backgroundColor = .green
        self.view.addSubview(uibutton)
        uibutton.translatesAutoresizingMaskIntoConstraints = false

        uibutton.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        uibutton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        uibutton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        uibutton.accessibilityIdentifier = "buttonIdentifier"
        self.button = uibutton
        self.button?.addTarget(self, action: #selector(modifyText), for: .touchUpInside
        )
    }

    func addDisableButton() {
        let disableBtn = UIButton(type: .roundedRect)
        disableBtn.isEnabled = false
        disableBtn.setTitle("DISABLE BUTTON", for: .normal)
        disableBtn.titleLabel?.textColor = .white
        disableBtn.titleLabel?.font = .systemFont(ofSize: 50)
        disableBtn.titleLabel?.textAlignment = .center
        disableBtn.backgroundColor = .blue
        self.view.addSubview(disableBtn)
        disableBtn.translatesAutoresizingMaskIntoConstraints = false

        if let button = self.button {
            disableBtn.topAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
            disableBtn.heightAnchor.constraint(equalTo: button.heightAnchor).isActive = true
        }
        disableBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        disableBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        disableBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        disableBtn.accessibilityIdentifier = "disableButtonIdentifier"
    }

    @objc func modifyText() {
        self.button?.setTitle("PRESSED", for: .normal)
    }
}
