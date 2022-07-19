//
//  FirstTests.swift
//  FirstTests
//
//  Created by Matthew Folbigg on 19/07/2022.
//

import XCTest
@testable import First

class FirstTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_HaterOnInit_IsFriendly() {
        //Arrange/Act
        let hater = Hater()
        
        //Assert
        XCTAssertFalse(hater.hating, "New Haters should not be hating")
    }
    
    func test_HaterAfterABadDay_IsHating() {
        //Arrange (Given)
        var hater = Hater()
        
        //Act (When)
        hater.hadABadDay()
        
        //Assert (Then)
        XCTAssertTrue(hater.hating)
    }
    
    func test_HaterAfterAGoodDay_IsNotHating() {
        //Arrange
        var hater = Hater()
        
        //Act
        hater.hadAGoodDay()
        
        //Assert
        XCTAssertFalse(hater.hating)
    }

}
