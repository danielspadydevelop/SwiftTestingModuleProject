//
//  ViewModel.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/25/25.
//

import Observation

enum MyNameViewModelError: Error {
    case emptyNamesError
}

@Observable
nonisolated
class NameViewModel {
    var names = [String]()

    func loadNames() async throws {
        // do some async work here
        names = ["BaiChao", "LuMeng"]
        
        if names.isEmpty {
            throw MyNameViewModelError.emptyNamesError
        }
    }
}
