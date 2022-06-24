//
//  ViewControllerWithWebView.swift
//  LBCTestKitDemo
//
//  Created by Aliou SARR on 12/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit
import WebKit

final class ViewControllerWithWebView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = WKWebView()
        webView.backgroundColor = UIColor.white
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.accessibilityIdentifier = "webViewIdentifier"
        self.view.addSubview(webView)

        webView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true

        if let url = Bundle.main.url(forResource: "sample_html", withExtension: "html") {
            webView.load(URLRequest(url: url))
        }
    }
}
