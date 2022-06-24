//
//  ViewControllerWithLink.swift
//  LBCTestKitDemo
//
//  Created by Jean Di Giovanni on 12/07/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithLink: UIViewController {

    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.accessibilityIdentifier = "textViewIdentifier"
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.delegate = self

        let attributedString = NSMutableAttributedString(string: "This is a normal text. This is a link. This is another normal text.")
        attributedString.addAttribute(.link, value: "https://www.leboncoin.fr/", range: (attributedString.string as NSString).range(of: "This is a link"))
        textView.attributedText = attributedString

        return textView
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Link tapped!"
        label.isHidden = true
        label.accessibilityIdentifier = "labelIdentifier"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.layout()
    }

    private func layout() {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.textView)
        NSLayoutConstraint.activate([
            self.textView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.textView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.textView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])

        self.view.addSubview(self.label)
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: self.textView.bottomAnchor),
            self.label.leadingAnchor.constraint(equalTo: self.textView.leadingAnchor),
            self.label.trailingAnchor.constraint(equalTo: self.textView.trailingAnchor)
        ])
    }
}

extension ViewControllerWithLink: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        self.label.isHidden = false
        return false
    }
}
