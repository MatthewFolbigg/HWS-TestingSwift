//
//  ThrowingTests.swift
//  Unit TestsTests
//
//  Created by Matthew Folbigg on 20/07/2022.
//
import XCTest
@testable import Unit_Tests

class ThrowingTests: XCTestCase {

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
    
    //MARK: - Catching Errors directly
    func test_PlayingBioBlitz_ThrowsNotPurchased() {
        let game = Game(name: "BioBlitz")
        
        do {
            try game.play()
            XCTFail() //Fails test if this line is called
        } catch GameError.notPurchased {
            //This is the error that should be thrown so the test will pass here.
        } catch {
            XCTFail()
        }
    }
    
    //MARK: - Using XCTAssert Throw
    func test_PlayingBlastazap_ThrowsNotInstalled() {
        let game = Game(name: "Blastazap")
        
        XCTAssertThrowsError(try game.play()) { error in
            XCTAssertEqual(error as? GameError, GameError.notInstalled)
        }
    }
    
    func test_PlayingExplodingMonkeys_NoErrorThrown() {
        let game = Game(name: "Exploding Monkeys")
        
        XCTAssertNoThrow(try game.play())
    }
    
    //MARK: - Throwing Tests
    func test_PlayingCrashyPlane_ThrowsError() throws { //Throwing tests will fail if any un-handled error is thrown
        let game = Game(name: "CrashyPlane")
        
        try game.play()
    }
    
    func test_PlayingDeadStormRising_ThrowsError() throws { //This games throws an error but the test passes as it is handled
        let game = Game(name: "Dead Storm Rising")
        
        do {
            try game.play()
        } catch {}
    }
}
