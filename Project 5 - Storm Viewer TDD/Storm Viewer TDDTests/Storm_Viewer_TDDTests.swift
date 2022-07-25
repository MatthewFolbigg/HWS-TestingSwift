//
//  Storm_Viewer_TDDTests.swift
//  Storm Viewer TDDTests
//
//  Created by Matthew Folbigg on 25/07/2022.
//

import XCTest
@testable import Storm_Viewer_TDD

class Storm_Viewer_TDDTests: XCTestCase {

    func test_ContentView_CanLoadImages() {
        let sut = ContentView()
         
        let pics = sut.loadImages()
        
        XCTAssertEqual(pics.count, 10, "There should be 10 images loaded")
    }
    
    func test_ContentView_HasCorrectTitle() {
        let sut = ContentView()
        
        
    }

}
