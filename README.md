# TestKit

[![Swift](https://img.shields.io/badge/Swift-5.6-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.3_5.4_5.5_5.6-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-iOS-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_Linux_Windows-Green?style=flat-square)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)

Every developer hates writing UITests. 
Me too. 
We wanted to make writing UI tests more fun. That's why we create Test Kit.

With Test Kit you can test all your UI Elements by using helper functions.

Requirements : All test elements must be identified by an accessibility identifier

# Configuration : 

## Add the Swift Package Manager in the UI Target

```
dependencies: [
    .package(url: "https://github.com/pocketal/TestKit.git")
]
```

## Import framework
`import XCTest`

## Init tester : 

`tester: LBCUIElementProvider =  LBCUITester(context: self.app)`

 
Exemple : 

```
import XCTest
import TestKit

class UITestClass: XCTestCase {

    public private(set) var tester: LBCUIElementProvider!
    public private(set) var app: XCUIApplication!

    override func setUp() {
        self.app = XCUIApplication()
        self.app.launch()
        // init tester
        self.tester = LBCUITester(context: self.app)
    }

    func testButton() {
       // get button
        self.tester.getButton(with: "buttonIdentifier")
            // validate title
            .validate(value: "C")
            // check state
            .validate(isEnabled: true)
            // tap action
            .tap()
    }
}
```
