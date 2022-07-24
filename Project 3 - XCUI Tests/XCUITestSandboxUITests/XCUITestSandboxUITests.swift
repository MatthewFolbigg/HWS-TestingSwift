//
//  XCUITestSandboxUITests.swift
//  XCUITestSandboxUITests
//
//  Created by Matthew Folbigg on 24/07/2022.
//  Copyright © 2022 Hacking with Swift. All rights reserved.
//

import XCTest

class XCUITestSandboxUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        let app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
    }
    
    func test_Label_DisplaysTextFieldContent() {
        let app = XCUIApplication()
        
        app.textFields.element.tap()
        app.keys["t"].tap()
        app.keys["e"].tap()
        app.keys["s"].tap()
        app.keys["t"].tap()
        app.keyboards.buttons["Return"].tap()
        
        XCTAssertEqual(app.staticTexts["TextFieldOutputLabel"].label, "test")
    }

    func test_SliderToFullLeft_SetsProgressTo100Percent() {
        let app = XCUIApplication()
        
        app.sliders["Completion"].adjust(toNormalizedSliderPosition: 0)
        guard let completion = app.progressIndicators.element.value as? String else {
            XCTFail("Unable to find slider progress indicator.")
            return
        }
        
        XCTAssertEqual(completion, "100%")
    }
    
    func test_BlueButton_ShowsAlert() {
        let app = XCUIApplication()
        
        app.buttons["Blue"].tap()
        XCTAssertTrue(app.alerts["Blue"].waitForExistence(timeout: 1))
        XCTAssertTrue(app.alerts["Blue"].isHittable)
        
        app.alerts["Blue"].buttons["OK"].tap()
        XCTAssertFalse(app.alerts["Blue"].exists)
    }
    
    func test_SegmentedControls_OmegaButtonSetsTitle() {
        let app = XCUIApplication()
        
        XCTAssertTrue(app.navigationBars["Alpha"].staticTexts["Alpha"].exists)
        app.segmentedControls.buttons["Omega"].tap()
        
        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "Title Change Attempt"
        attachment.lifetime = .deleteOnSuccess
        add(attachment)
        
        XCTAssertTrue(app.navigationBars["Omega"].staticTexts["Omega"].exists)
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
