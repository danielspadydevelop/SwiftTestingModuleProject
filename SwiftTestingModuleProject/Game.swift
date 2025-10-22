//
//  Game.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/22/25.
//

enum GameError: Error {
    case notPurchased
    case notInstalled
    case parentalControlsDisallowed
}

enum GameTitle: String {
    case bio = "BioBlitz"
    case blast = "Blastazap"
    case patch = "Patch Match"
}

struct Game {
    let name: String

    func play() throws {
        if name == GameTitle.bio.rawValue {
            throw GameError.notPurchased
        } else if name == GameTitle.blast.rawValue {
            throw GameError.notInstalled
        } else if name == GameTitle.patch.rawValue {
            throw GameError.parentalControlsDisallowed
        } else {
            print("\(name) is okay to play!")
        }
    }
}
