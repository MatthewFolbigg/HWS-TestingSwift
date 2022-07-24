//
//  Game.swift
//  Unit Tests
//
//  Created by Matthew Folbigg on 20/07/2022.
//

import Foundation

struct Game {
    let name: String

    func play() throws {
        print("Playing game: \(name)")
        if name == "BioBlitz" {
            throw GameError.notPurchased
        } else if name == "Blastazap" {
            throw GameError.notInstalled
        } else if name == "Dead Storm Rising" {
            throw GameError.parentalControlsDisallowed
        } else {
            print("\(name) is OK to play!")
        }
    }
}

enum GameError: Error {
    case notPurchased
    case notInstalled
    case parentalControlsDisallowed
}
