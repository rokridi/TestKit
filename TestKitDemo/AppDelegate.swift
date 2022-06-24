//
//  AppDelegate.swift
//  LBCTestKitDemo
//
//  Created by Luís Figueiredo on 20/04/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var testKitService: LBCTestKitServiceProtocol?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)

        self.testKitService = LBCTestKitService(configurator: LBCTestingConfigurator(appDelegate: self))
        if testKitService?.applyTestingEnvironment() == false {
            self.window?.rootViewController = DefaultViewController()
        } else {
            UIView.setAnimationsEnabled(false)
        }

        self.window?.makeKeyAndVisible()

        return true
    }
}

final class LBCTestingConfigurator: LBCTestKitConfiguratorProtocol {

    private weak var appDelegate: AppDelegate?

    private var window: UIWindow? {
        return self.appDelegate?.window
    }

    init(appDelegate: AppDelegate?) {
        self.appDelegate = appDelegate
    }

    // MARK: - UI Tests services

    func applyTestingConfiguration(key: String) {

    }

    // MARK: - UI Tests home page

    func applyTestkitHomePage(key: String) {
        let viewController: UIViewController
        let pageType = HomePageType(rawValue: key) ?? .none

        switch pageType {
        case .empty:
            viewController = LBCEmptyViewController()
        case .homePageWithActivityIndicator:
        viewController = ViewControllerWithActivityIndicator()
        case .homePageWithAlert:
            viewController = ViewControllerWithAlert()
        case .homePageWithActionSheet:
            viewController = ViewControllerWithActionSheet()
        case .homePageWithButton:
            viewController = ViewControllerWithButton(text: "C")
        case .homePageWithCollectionView:
            let navigationController = UINavigationController(rootViewController: ViewControllerWithCollectionView())
            viewController = navigationController
        case .homePageWithCustomPickerView:
            viewController = ViewControllerWithCustomPickerView()
        case .homePageWithDatePicker:
            viewController = ViewControllerWithDatePicker()
        case .homePageWithImage:
            viewController = ViewControllerWithImage()
        case .homePageWithLabelA:
            viewController = ViewControllerWithLabel(text: "A")
        case .homePageWithLabelB:
            viewController = ViewControllerWithLabel(text: "B")
        case .homePageWithMap:
            viewController = ViewControllerWithMap()
        case .homePageWithNavigationBar:
            viewController = ViewControllerWithNavigationBar.createController()
        case .homePageWithPageIndicator:
            viewController = ViewControllerWithPageIndicator()
        case .homePageWithPicker:
            viewController = ViewControllerWithPicker(values: ["First", "Second"])
        case .homePageWithProgessView:
            viewController = ViewControllerWithProgressView()
        case .homePageWithScrollView:
            let navigationController = UINavigationController(rootViewController: ViewControllerWithScrollView())
            viewController = navigationController
        case .homePageWithSearchBar:
            viewController = ViewControllerWithSearchBar()
        case .homePageWithSecuredTextField:
            viewController = ViewControllerWithSecuredTextField()
        case .homePageWithSegmentedControl:
            viewController = ViewControllerWithSegmentedControl(values: ["First", "Second"])
        case .homePageWithSlider:
            viewController = ViewControllerWithSlider()
        case .homePageWithStepper:
            viewController = ViewControllerWithStepper()
        case .homePageWithSwitch:
            viewController = ViewControllerWithSwitch()
        case .homePageWithTabBar:
            viewController = ViewControllerWithTabBar()
        case .homePageWithTableViewNormalMode:
            viewController = ViewControllerWithTableView(withMode: .normal(numberOfCells: 6, hasPullToRefresh: false))
        case .homePageWithTableViewEditMode:
            viewController = ViewControllerWithTableView(withMode: .edit(numberOfCells: 6, hasPullToRefresh: false))
        case .homePageWithTableViewScrollableContent:
            viewController = ViewControllerWithTableView(withMode: .normal(numberOfCells: 100, hasPullToRefresh: false))
        case .homePageWithTableViewEmptyPullToRefresh:
            viewController = ViewControllerWithTableView(withMode: .normal(numberOfCells: 0, hasPullToRefresh: true))
        case .homePageWithTableViewPullToRefresh:
            viewController = ViewControllerWithTableView(withMode: .normal(numberOfCells: 2, hasPullToRefresh: true))
        case .homePageWithTextField:
            viewController = ViewControllerWithTextField()
        case .homePageWithTextView:
            viewController = ViewControllerWithTextView()
        case .homePageWithToolbar:
            viewController = ViewControllerWithToolbar()
        case .homePageWithUIControl:
            viewController = ViewControllerWithUIControl()
        case .homePageWithView:
            viewController = ViewControllerWithView()
        case .homePageWithWebView:
            viewController = ViewControllerWithWebView()
        case .homePageWithLink:
            viewController = ViewControllerWithLink()
        case .none:
            viewController = DefaultViewController()
        }
        self.window?.rootViewController = viewController
    }
}
