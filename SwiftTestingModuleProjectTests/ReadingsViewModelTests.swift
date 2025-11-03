//
//  ReadingsViewModelTests.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 11/2/25.
//

@testable import SwiftTestingModuleProject

import Testing

@Suite("Loading view model readings", .timeLimit(.minutes(1)))
struct ReadingsViewModelTests {
    @Test("At least 10 readings must be returned.", .tags(.readingViewModel))
    @MainActor
    func loadReadings() async {
        let viewModel = ReadingsViewModel()

        await withCheckedContinuation { continuation in
            viewModel.loadReadings { readings in
                #expect(readings.count >= 10, "At least 10 readings must be returned.")
                continuation.resume()
            }
        }
    }
}
