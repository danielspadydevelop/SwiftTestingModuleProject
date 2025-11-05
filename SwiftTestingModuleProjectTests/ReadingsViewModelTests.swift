//
//  ReadingsViewModelTests.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 11/2/25.
//

@testable import SwiftTestingModuleProject

import Testing
import Foundation

@Suite("Loading view model readings", .timeLimit(.minutes(1)))
struct ReadingsViewModelTests {
    
    @Test("At least 10 readings must be returned.", .tags(.readingViewModel))
    @MainActor
    func loadReadings() async {
        let viewModel = ReadingsViewModel()
        let url = URL(string: "https://hws.dev/readings.json")!

        await withCheckedContinuation { continuation in
            viewModel.loadReadings(url: url) { readings in
                #expect(readings.count >= 10, "At least 10 readings must be returned.")
                continuation.resume()
            }
        }
    }
    
    @Test("Url is not valid and returns empty array", .tags(.readingViewModel))
    @MainActor
    func loadEmptyReadings() async {
        let viewModel = ReadingsViewModel()
        let url = URL(string: "https://hws.dev/readings.json/invalid")!

        await withCheckedContinuation { continuation in
            viewModel.loadReadings(url: url) { readings in
                #expect(readings.count == 0, "0 readings should be returned")
                continuation.resume()
            }
        }
    }
}
