//
//  ViewControllerWithScrollView.swift
//  LBCTestKitDemo
//
//  Created by Aliou SARR on 03/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithScrollView: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "scrollViewIdentifier"
        return scrollView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4.0
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "ViewControllerWithScrollView"
        self.addScrollView()
        self.addStackView()
        self.addScrollViewContent()

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        self.scrollView.refreshControl = refreshControl
    }

    @objc
    private func pullToRefresh() {
        let newLabel = UILabel()
        newLabel.translatesAutoresizingMaskIntoConstraints = false
        newLabel.accessibilityIdentifier = "new.label"
        newLabel.numberOfLines = 0
        newLabel.text = "Added content"
        newLabel.backgroundColor = .yellow
        self.stackView.insertArrangedSubview(newLabel, at: 0)
        self.scrollView.refreshControl?.endRefreshing()
    }

    private func addStackView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self.stackView)
        self.stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true

        self.scrollView.addSubview(view)
        view.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        view.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    }

    func addScrollView() {
        self.view.addSubview(self.scrollView)

        self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }

    func addScrollViewContent() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = """
 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas commodo lectus leo, id ornare lectus aliquam vitae. Aenean dui nisl, tempor at felis suscipit, feugiat efficitur tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nunc dictum leo vel tortor laoreet sagittis. Quisque iaculis ex in enim tristique tincidunt. Nullam imperdiet, ligula imperdiet interdum volutpat, mauris nunc elementum purus, a pulvinar felis eros id lorem. Quisque finibus, erat ac lacinia fringilla, dui velit tempus eros, quis efficitur quam justo ac ipsum. Vivamus placerat tellus vel orci posuere, in blandit arcu bibendum. Donec ut mi ornare risus molestie vestibulum. Fusce lobortis condimentum turpis ut facilisis. Quisque tempor volutpat orci quis hendrerit.

        Donec nec ex a enim tempor tincidunt. Integer faucibus lacus lectus, varius lacinia augue fringilla quis. Vivamus libero libero, consectetur a sagittis id, gravida at nunc. Fusce malesuada, purus venenatis dapibus viverra, nisl libero sollicitudin massa, ut tincidunt nisi ex non velit. Proin facilisis, nisl ac aliquam venenatis, nunc odio egestas arcu, pellentesque lacinia lorem leo sit amet magna. Sed pretium libero vel dolor faucibus lacinia. Cras eu felis ac quam sollicitudin ornare. Donec vel lacus sed felis porttitor sollicitudin et ut est. Mauris aliquam posuere mi, eget auctor ipsum finibus eget.

        Pellentesque commodo semper ex, et malesuada sapien pulvinar ut. Praesent luctus pharetra mi consequat porttitor. Suspendisse ut consequat nisl. Nunc a turpis justo. Nulla ut mi ac velit blandit condimentum eget a nisi. Etiam varius diam elit, nec euismod lorem bibendum ac. Curabitur auctor, justo eget luctus pretium, nunc sapien lacinia velit, id fermentum neque ipsum sit amet odio. Etiam sodales accumsan maximus. Vivamus porta placerat mi, at pretium ante pulvinar nec.

        Pellentesque arcu ante, interdum sit amet dictum vel, commodo placerat sem. Proin vel urna nec lacus faucibus facilisis non ut arcu. Ut porttitor vestibulum magna, id posuere lorem suscipit non. Maecenas vulputate eros vel tincidunt bibendum. Mauris venenatis porttitor ex in ultrices. Morbi pretium mollis lacus, eu malesuada nisi blandit vitae. Morbi molestie tellus porttitor eros dignissim, ut venenatis ligula molestie. Etiam placerat, elit sed tristique tempus, leo nisi pulvinar justo, non sodales nulla quam in leo. Aenean interdum, sapien at bibendum commodo, nisl nisi malesuada tortor, ut pellentesque sapien purus sed nibh. Donec ut odio dignissim, luctus est non, viverra lorem.
 """

        let bottomEndLabel = UILabel()
        bottomEndLabel.accessibilityIdentifier = "bottom.label"
        bottomEndLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomEndLabel.textAlignment = .center
        bottomEndLabel.backgroundColor = .red
        bottomEndLabel.text = "This is the bottom"

        self.stackView.addArrangedSubview(label)
        self.stackView.addArrangedSubview(bottomEndLabel)
    }
}
