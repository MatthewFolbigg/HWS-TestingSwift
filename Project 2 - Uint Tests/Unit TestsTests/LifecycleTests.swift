//
//  LifecycleTests.swift
//  Unit TestsTests
//
//  Created by Matthew Folbigg on 20/07/2022.
//

import XCTest

class LifecycleTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("Setup with error")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("TearDown with error")
    }
    
    override class func setUp() {
        print("Class setup")
    }
    
    override class func tearDown() {
        print("Class tearDown")
    }

    func testExample() throws {
        print("Starting a test")
        
        addTeardownBlock {
            print("In tearDownBlock 1")
        }
        
        print("Middle of test")
        
        addTeardownBlock {
            print("In tearDownBlock 2")
        }
        
        print("End of test")
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
