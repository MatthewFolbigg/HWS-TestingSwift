//
//  Hater.swift
//  First
//
//  Created by Matthew Folbigg on 19/07/2022.
//

import Foundation

struct Hater {
    var hating = false
    
    mutating func hadABadDay() {
        hating = true
    }
    
    mutating func hadAGoodDay() {
        hating = false
    }
}
