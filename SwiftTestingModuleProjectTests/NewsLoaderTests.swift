//
//  NewsLoaderTests.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/31/25.
//

@testable import SwiftTestingModuleProject

import Testing

@Suite("Confirmation Range Tests with NewsLoader", .timeLimit(.minutes(1)))
@MainActor
struct ConfirmationRangeNewsLoaderTests {
    @Test("At Least 5 to 10 feeds should be returned", .tags(.mainActorTests))
    func fiveToTenFeedsAreLoaded() async throws {
        let loader = NewsLoader()

        await confirmation(expectedCount: 5...10) { confirm in
            for await _ in loader {
                confirm()
            }
       }
    }
}
