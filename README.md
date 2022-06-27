# TestKit

Every developer hate write UITest. Me too.
We wanted to make UITest writing more funny.
Thats why we create TestKit.

With TestKit you can test all your UI Elements by using heplers functions.

Requirements : All test element must be identified by an accessibility identifier

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
