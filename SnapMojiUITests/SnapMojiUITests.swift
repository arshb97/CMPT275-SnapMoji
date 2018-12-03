//
//  SnapMojiUITests.swift
//  SnapMojiUITests
//
//  Created by Evan Lam on 10/26/18.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//
// Run each test by pressing the corresponding play button next to each automated test
// Each test is run on the iPhone 7 simulator
// The sleep loops are in order to ensure that the simulator is in sync with the Xcode automated tester

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
        //Automated Test Case 1: <Test Emotions> A test of each emotion (friends page) for UI functionality
        //Procedure: The application is opened and the main page is pressed. The sample friend is chosen. The top left emotion is pressed and the cancel button is pressed afterwards. This procedure is repeated for all eight emotions.
        //Status: Pass
        
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
        //Automated Test Case 2: <Test Toolbars> A test that tests each toolbar button
        //Procedure: The application is opened and the main page is pressed. Each toolbar icon is pressed in order from left to right, and back from right to left. Pressing a toolbar icon while on the current page is also tested and should do nothing.
        //Status: Pass
        
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
    
    func testAddFriends(){
        //Automated Test Case 3: <Test Multiple Additions of Friend> A test that tests addition of multiple friends and includes keyboard typing
        //Procedure: The application is opened and the main page is pressed. The “Add Friend” button is pressed. “Smith” is typed and confirmed. “Add Friend” is repeated with “Johnny”.
        // Status: Pass
        
        let app = XCUIApplication()
        app.staticTexts["Main"].tap()
        
        let addButton = app.buttons["add"]
        while(!addButton.exists){
            sleep(1)
        }
        addButton.tap()
        
        let textField = app.textFields["Enter Name"]
        textField.tap()
        textField.typeText("Smith")
        
        let saveButton = app.alerts["Add New Friend"].buttons["Save"]
        saveButton.tap()
        
        let cellsQuery = app.collectionViews.cells
        cellsQuery.otherElements.containing(.staticText, identifier:"Smith").buttons["friends"].tap()
        
        let backButton = app.buttons["back"]
        backButton.tap()
        while(!addButton.exists){
            sleep(1)
        }
        addButton.tap()
        textField.tap()
        textField.typeText("Johnny")
        saveButton.tap()
        cellsQuery.otherElements.containing(.staticText, identifier:"Johnny").buttons["friends"].tap()
        backButton.tap()
        
        
        
        
    }
    
    func testStatisticPage(){
        //Automated Test Case 4: <Test Statistic Page> A test that tests the “Statistic page of SnapMoji”
        //Procedure: The application is opened and the statistic page is pressed. Then it accesses the statistic page with a graph on the top and buttons below it. Then the app presses on each button five times to see a changing graph axis and data points.
        //Status: Pass
        
        let app = XCUIApplication()
        app.staticTexts["Statistics"].tap()
        
        let easyStatisticButton = app.buttons["Easy-Statistic"]
        easyStatisticButton.tap()
        easyStatisticButton.tap()
        easyStatisticButton.tap()
        easyStatisticButton.tap()
        easyStatisticButton.tap()
        
        let mediumStatisticButton = app.buttons["Medium-Statistic"]
        mediumStatisticButton.tap()
        mediumStatisticButton.tap()
        mediumStatisticButton.tap()
        mediumStatisticButton.tap()
        mediumStatisticButton.tap()
        
        let hardStatisticButton = app.buttons["Hard-Statistic"]
        hardStatisticButton.tap()
        hardStatisticButton.tap()
        hardStatisticButton.tap()
        hardStatisticButton.tap()
        hardStatisticButton.tap()
        
        let descriptionStatisticButton = app.buttons["Description-Statistic"]
        descriptionStatisticButton.tap()
        descriptionStatisticButton.tap()
        descriptionStatisticButton.tap()
        descriptionStatisticButton.tap()
        descriptionStatisticButton.tap()
    }
    
    func testDescriptionPage(){
        //Automated Test Case 5: <Test Description Page> A test that tests the “Definition and Cause of each Emotion”
        //Procedure: The application is opened and the description page is pressed. Then it accesses the description page with 8 emotion buttons on it. Then tapping on each button will lead to another page with definition and cause of this corresponding emotion before hitting the back button.
        //Status: Pass
        
        let app = XCUIApplication()
        app.staticTexts["Main"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .button).element(boundBy: 4).tap()
        app.buttons["    Happiness"].tap()
        
        let backButton = app.buttons["back"]
        backButton.tap()
        app.buttons["    Sadness"].tap()
        backButton.tap()
        app.buttons["    Angry"].tap()
        backButton.tap()
        app.buttons["    Surprise"].tap()
        backButton.tap()
        app.buttons["    Disgust"].tap()
        backButton.tap()
        app.buttons["    Fear"].tap()
        backButton.tap()
        app.buttons["    Contempt"].tap()
        backButton.tap()
        app.buttons["    Neutral"].tap()
        backButton.tap()
        app.staticTexts["Description"].tap()
    }
    
    func testDescriptionTesting(){
        //Automated Test Case 6: <Test of Descriptions Test> A test that tests the “Descriptions of Emotions Test”
        // Procedure: The application is opened and the description page is pressed. The “Descriptions of Emotions”  radio button is selected. The test is started and the first option is selected for each test. The test is submitted and the result displayed. It is set to select no options for all tests with a score of 0/5.
        //Status: Pass
        
        let app = XCUIApplication()
        app.staticTexts["Test"].tap()
        app.buttons["DESCRIPTION OF EMOTIONS"].tap()
        app.buttons["Start Test"].tap()
        
        let nextButton = app.buttons["Next"]
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()
        app.alerts["Nice job!"].buttons["Restart"].tap()
        app.buttons["back"].tap()
        
    }
    
    func testEasyTesting(){
        //Automated Test Case 7: <Test Testing Process> A test that tests every difficulty
        //Procedure: The application is opened and the test page is pressed. Then the Easy difficulty is selected before tapping on start button. Then a test of emotions begins. It is set to select no options for all tests with a score of 0/5. After this, a summary result shows up with a correct mark.
        //Status: Pass
        
        let app = XCUIApplication()
        app.staticTexts["Test"].tap()
        app.buttons["EASY - WHOLE FACE"].tap()
        app.buttons["Start Test"].tap()
        
        let nextButton = app.buttons["Next"]
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()
        app.alerts["Nice job!"].buttons["Restart"].tap()
        app.buttons["back"].tap()
        
    }
    
    func testMediumTesting(){
        //Automated Test Case 8: <Test Testing Process> A test that tests every difficulty
        //Procedure: The application is opened and the test page is pressed. Then the Medium difficulty is selected before tapping on start button. Then a test of emotions begins. It is set to select no options for all tests with a score of 0/5. After this, a summary result shows up with a correct mark.
        //Status: Pass
        let app = XCUIApplication()
        app.staticTexts["Test"].tap()
        app.buttons["MEDIUM - BOTTOM HALF"].tap()
        app.buttons["Start Test"].tap()
        
        let nextButton = app.buttons["Next"]
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()
        app.alerts["Nice job!"].buttons["Restart"].tap()
        app.buttons["back"].tap()
        
        
        
    }
    func testHardTesting(){
        //Automated Test Case 9: <Test Testing Process> A test that tests every difficulty
        //Procedure: The application is opened and the test page is pressed. Then the Hard difficulty is selected before tapping on start button. Then a test of emotions begins. It is set to select no options for all tests with a score of 0/5. After this, a summary result shows up with a correct mark.
        //Status: Pass
        let app = XCUIApplication()
        app.staticTexts["Test"].tap()
        app.buttons["HARD - TOP HALF"].tap()
        app.buttons["Start Test"].tap()
        
        let nextButton = app.buttons["Next"]
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()
        app.alerts["Nice job!"].buttons["Restart"].tap()
        app.buttons["back"].tap()
    }
    
}


