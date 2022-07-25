//
//  User.swift
//  TDDTests
//
//  Created by Matthew Folbigg on 25/07/2022.
//

import Foundation

struct User {
    private var ownedProducts = Set<String>()
    
    mutating func buy(_ product: String) {
        ownedProducts.insert(product)
    }
    
    func owns(_ product: String) -> Bool {
        return ownedProducts.contains(product)
    }
}
