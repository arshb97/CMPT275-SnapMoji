//
//  SnapMojiUITests.swift
//  SnapMojiUITests
//
//  Created by Evan Lam on 10/26/18.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import XCTest

class SnapMojiUITests: XCTestCase {

    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before thi  ey run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
//    func waitForElementToAppear(_ element: XCUIElement) -> Bool {
//        let predicate = NSPredicate(format: "exists == true")
//        let buttonexpectation = expectation(for: predicate, evaluatedWith: element,
//                                      handler: nil)
//
//        let result = XCTWaiter().wait(for: [buttonexpectation], timeout: 5)
//        return result == .completed
//    }
    
    func testSampleEmotion() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.staticTexts["Main"].tap()
        while(!app.collectionViews.buttons["friends"].exists){
            sleep(1)
        }
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["friends"]/*[[".cells.buttons[\"friends\"]",".buttons[\"friends\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        while(!app.buttons["Samplehappiness"].exists){
            sleep(1)
        }
        app.buttons["Samplehappiness"].tap()
        let cancelButton = app.buttons["Cancel"]
        if(!cancelButton.exists){
            sleep(1)
        }
        cancelButton.tap()
        app.buttons["Samplesadness"].tap()
        cancelButton.tap()
        app.buttons["Sampleanger"].tap()
        cancelButton.tap()
        app.buttons["Samplesurprise"].tap()
        cancelButton.tap()
        app.buttons["Sampledisgust"].tap()
        cancelButton.tap()
        app.buttons["Samplefear"].tap()
        cancelButton.tap()
        app.buttons["Samplecontempt"].tap()
        cancelButton.tap()
        app.buttons["Sampleneutral"].tap()
        cancelButton.tap()
    }
    
    func testToolbar(){
        
        let app = XCUIApplication()
        app.staticTexts["Main"].tap()
        
        let window = app.children(matching: .window).element(boundBy: 0)
        let element = window.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .button).element(boundBy: 1).tap()
        element.children(matching: .button).element(boundBy: 2).tap()
        window.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .button).element(boundBy: 9).tap()
        window.children(matching: .other).element(boundBy: 2).children(matching: .other).element.children(matching: .button).element(boundBy: 8).tap()
        window.children(matching: .other).element(boundBy: 3).children(matching: .other).element.children(matching: .button).element(boundBy: 13).tap()
        
    }
    
    func testAddFriend1(){
        
        let app = XCUIApplication()
        app.staticTexts["Main"].tap()
        
        let addButton = app.buttons["add"]
        addButton.tap()
        while(!addButton.exists){
            sleep(1)
        }
        let textField = app.textFields["Enter Name"]
        textField.tap()
        textField.typeText("Smith")
        
        let saveButton = app.alerts["Add New Friend"].buttons["Save"]
        saveButton.tap()
        
        let cellsQuery = app.collectionViews.cells
        cellsQuery.otherElements.containing(.staticText, identifier:"Smith").buttons["friends"].tap()
        
        let backButton = app.buttons["back"]
        backButton.tap()
        addButton.tap()
        textField.tap()
        textField.typeText("Johnny")
        saveButton.tap()
        cellsQuery.otherElements.containing(.staticText, identifier:"Johnny").buttons["friends"].tap()
        backButton.tap()
        
    }
}


