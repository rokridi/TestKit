//
//  ViewControllerWithImage.swift
//  LBCTestKitDemo
//
//  Created by Aliou SARR on 11/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithImage: UIViewController {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logo")
        imageView.accessibilityIdentifier = "imageIdentifier"
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.view.addSubview(self.imageView)
        self.imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        self.imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
    }
}
