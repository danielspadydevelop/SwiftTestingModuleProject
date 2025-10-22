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

@Test func playingBlastazapThrows() {
    let game = Game(name: GameTitle.blast.rawValue)

    #expect(throws: GameError.notInstalled) {
        try game.play()
    }
}

@Test func playingOddOneOutDoesntThrow() {
    let game = Game(name: "Odd One Out")
    #expect(throws: Never.self) {
        try game.play()
    }
}
