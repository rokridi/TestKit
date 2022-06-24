//
//  ViewControllerWithTabBar.swift
//  LBCTestKitDemo
//
//  Created by Aliou SARR on 29/01/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstViewController = UIViewController()
        firstViewController.view.backgroundColor = .blue
        let tabBarItem1 = UITabBarItem(title: "Item 1", image: nil, tag: 0)
        tabBarItem1.accessibilityIdentifier = "tabBarItem1Identifier"
        firstViewController.tabBarItem = tabBarItem1

        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .red
        let tabBarItem2 = UITabBarItem(title: "Item 2", image: nil, tag: 1)
        tabBarItem2.accessibilityIdentifier = "tabBarItem2Identifier"
        secondViewController.tabBarItem = tabBarItem2

        let tabBarList = [firstViewController, secondViewController]

        viewControllers = tabBarList

        self.tabBar.accessibilityIdentifier = "tabBarIdentifier"

    }

}
