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

@Test func patchMatchThrows() throws {
    let game = Game(name: "Patch Match")
    try game.play()
}

extension GameError: @retroactive CustomTestStringConvertible {
    public var testDescription: String {
        switch self {
        case .notPurchased:
            "This game has not been purchased."
        case .notInstalled:
            "This game is not currently installed."
        case .parentalControlsDisallowed:
            "This game has been blocked by parental controls."
        }
    }
}

@Test func loadNames() async {
    let viewModel = TestViewModel()

    await withKnownIssue("Names can sometimes come back with too few values", isIntermittent: true) {
        try await viewModel.loadNames()
        #expect(viewModel.names.isEmpty == false, "Names should be full of values.")
    }
}

struct TestViewModel {
    var names: [String] = []
    func loadNames() async throws {
        
    }
}
