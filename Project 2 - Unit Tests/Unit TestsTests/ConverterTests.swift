//
//  ConverterTests.swift
//  Unit TestsTests
//
//  Created by Matthew Folbigg on 20/07/2022.
//

import XCTest
@testable import Unit_Tests

class ConverterTests: XCTestCase {
    var sut: Converter!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = false //MARK: Stops running tests as soon as one fails
        sut = Converter()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
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
    
    func test_Convert32Farenheit_Is0Celsius() {
        let inputFarenheit = 32.0
        let outputCelsius = sut.convertToCelsius(inputFarenheit)
        
        XCTAssertEqual(outputCelsius, 0, accuracy: 0.0001)
    }
    
    func test_Convert212Farenheit_Is100Celsius() {
        let inputFarenheit = 212.0
        let outputCelsius = sut.convertToCelsius(inputFarenheit)
        
        XCTAssertEqual(outputCelsius, 100, accuracy: 0.0001)
    }
    
    func test_Divide10By3_HasQuotientOf3AndRemainderOf1() {
        let dividend = 10
        let divsor = 3
        
        let result = sut.divisionRemainder(of: dividend, dividedBy: divsor)
        
        AssertDivision(result: result, hasQuotient: 3, andRemainder: 1)
    }
    
    func AssertDivision(result: (quotient: Int, remainder: Int), hasQuotient: Int, andRemainder: Int, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(result.quotient, 3, file: file, line: line)
        XCTAssertEqual(result.remainder, 1, file: file, line: line)
    }
    

}
