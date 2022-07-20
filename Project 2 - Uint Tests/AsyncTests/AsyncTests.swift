//
//  AsyncTests.swift
//  AsyncTests
//
//  Created by Matthew Folbigg on 20/07/2022.
//

import XCTest
@testable import Unit_Tests

class AsyncTests: XCTestCase {
    //MARK: - As async tests are slow it's a good idea to disable these from Product -> Scheme -> Edit Scheme -> Tests -> Info. This prevents them being run every time tests are run.

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
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //MARK: - Basic Expectations
    func test_PrimeCalulatorUpTo100_Finds0Primes() {
        let maxCount = 100
        //MARK: This test shouldn't pass but it does because the async completion block is ignored
        PrimeCalculator.calculate(upTo: maxCount) {
            XCTAssertEqual($0.count, 0)
        }
    }
    
    func test_PrimeCalulatorUpTo100_Finds25Primes() {
        let maxCount = 100
        let expectation = XCTestExpectation(description: "Calculate prime numbers up to \(maxCount)")
        
        PrimeCalculator.calculate(upTo: maxCount) {
            XCTAssertEqual($0.count, 25)
            expectation.fulfill()
        }

        //Waits UP TO the timeout for fufill to be called
        //Fails if the fufill() method is not called within the timeout
        wait(for: [expectation], timeout: 10)
    }
    
    //MARK: - Notification tests
    func test_UserUpgraded_NotificationSentPROBLEMATIC() {
        let user = User()
        let notifyExpectation = XCTNSNotificationExpectation(name: User.upgradedNotification)
        
        user.upgrade()
        
        //Problematic as it will respond to any notification sharing the same name.
        wait(for: [notifyExpectation], timeout: 3)
    }
    
    func test_UserUpgraded_NotificationSent() {
        //This version listens to a specific injected noitification channel
        let center = NotificationCenter()
        let user = User()
        let notifyExpectation = XCTNSNotificationExpectation(name: User.upgradedNotification, object: nil, notificationCenter: center)
        
        user.upgrade(using: center)
        
        wait(for: [notifyExpectation], timeout: 3)
    }
    
    //MARK: - Performance Tests
    func test_PrimeCalulatorSync_Performance() {
        measure {
            _ = PrimeCalculator.calculateSync(upTo: 1000000)
        }
    }
    
}
