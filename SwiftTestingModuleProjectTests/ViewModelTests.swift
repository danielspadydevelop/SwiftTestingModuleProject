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
    @Test("Loading empty view model names")
    func loadNamesEmpty() async {
        let viewModel = NameViewModel()
        viewModel.names = []

        do {
            try await viewModel.loadNames()
            try #require(viewModel.names.isEmpty == true, "Names should be empty.")
        } catch {
            print(error)
        }
    }
    
    @Test("Loading view model names")
    func loadNames() async {
        let viewModel = NameViewModel()
        viewModel.names = ["BaiChao", "LuMeng"]

        do {
            try await viewModel.loadNames()
            try #require(viewModel.names.isEmpty == false, "Names should be full of values.")
        } catch {
            print(error)
        }
    }

}
