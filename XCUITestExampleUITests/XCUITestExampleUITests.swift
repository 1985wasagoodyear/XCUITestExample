//
//  XCUITestExampleUITests.swift
//  XCUITestExampleUITests
//
//  Created by Kevin Yu on 8/31/18.
//  Copyright © 2018 Kevin Yu. All rights reserved.
//

import XCTest

class XCUITestExampleUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func wearShorts() {

    }
    
    func testUIDidAppear() {
        // check if a label with "Fromage" exists
        let label = app.staticTexts["Fromage"]
        XCTAssertEqual(label.exists, true)
        
        // check if a button with "Zest" exists
        let button = app.buttons["Zest"]
        XCTAssertEqual(button.exists, true)
        XCTAssertEqual(button.label , "Zest")
        
        // check if a label with Fennel does not exist
        let label2 = app.staticTexts["Fennel"]
        XCTAssertEqual(label2.exists, false)
    }
    
    func testButtonCanChangeText() {
        // can set up a query for an item before it exists,
        // then set an expectation to test if/when it appears
        let button = app.buttons["Zest"]
        let label = app.staticTexts["Fennel"]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: label, handler: nil)
            
        button.tap()
        
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssert(label.exists)
        XCTAssertEqual(label.label, "Fennel")
    }
    
    func testCanShowLabelOnNewVC() {
        // can access a button by the Accessibility Label we've set on the Storyboard
        let button = app.buttons["nextVC"]
        XCTAssert(button.exists)
        
        button.tap()
        
        // a new label appears on a new VC when it appears
        // set an expectation to check if it exists/appears
        let label = app.staticTexts["Oranges"]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: label, handler: nil)
        
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssert(label.exists)
        
        // the original label on the first VC is no longer visible
        // so it will actually no longer exist
        let label2 = app.staticTexts["Fromage"]
        XCTAssertEqual(label2.exists, false)

    }
    
}
