//
//  PlayerTests.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/24/25.
//

@testable import SwiftTestingModuleProject

import Testing

struct DefaultPlayerTrait: TestTrait, TestScoping {
    func provideScope(
      for test: Test,
      testCase: Test.Case?,
      performing function: @isolated(any) () async throws -> Void
    ) async throws {
        let player = Player(name: "Natsuki Subaru")

        try await Player.$current.withValue(player) {
            try await function()
        }
    }
}

struct FantasyPlayerTrait: TestTrait, TestScoping {
    func provideScope(
      for test: Test,
      testCase: Test.Case?,
      performing function: @isolated(any) () async throws -> Void
    ) async throws {
        let player = Player(name: "Cloud Strife")

        try await Player.$current.withValue(player) {
            try await function()
        }
    }
}


extension Trait where Self == DefaultPlayerTrait {
    static var defaultPlayer: Self { Self() }
}

extension Trait where Self == FantasyPlayerTrait {
    static var fantasyPlayer: Self { Self() }
}


@Suite("Player Welcome Screen tests", .timeLimit(.minutes(1)))
struct PlayerTests {
    @Test(.defaultPlayer)
    func welcomeScreenShowsDefaultName() {
        let result = createWelcomeScreen()
        #expect(result.contains("Natsuki Subaru"))
    }
    
    @Test(.fantasyPlayer)
    func welcomeScreenShowsFantasyPlayer() {
        let result = createWelcomeScreen()
        #expect(result.contains("Cloud Strife"))
    }
}
