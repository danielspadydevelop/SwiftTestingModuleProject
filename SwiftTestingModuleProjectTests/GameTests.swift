//
//  GameTests.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/22/25.
//

@testable import SwiftTestingModuleProject
import Testing

@Test func playingBioBlitzThrows() {
    let game = Game(name: GameTitle.bio.rawValue)

    do {
        try game.play()
        Issue.record()
    } catch GameError.notPurchased {
        // success!
    } catch {
        Issue.record()
    }
}
