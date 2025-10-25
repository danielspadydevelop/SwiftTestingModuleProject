//
//  ViewModelTests.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/25/25.
//
@testable import SwiftTestingModuleProject

import Testing

@Suite("Concurrency and async/await tests", .timeLimit(.minutes(1)))
struct DataHandling {
    @Test("Loading view model names")
    func loadNames() async {
        let viewModel = NameViewModel()
        try await viewModel.loadNames()
        // try #require(viewModel.names.isEmpty == false, "Names should be full of values.")
        #expect(viewModel.names.isEmpty == false, "Names should be full of values.")
    }
}
