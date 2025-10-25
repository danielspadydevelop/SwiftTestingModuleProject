//
//  ViewModel.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/25/25.
//

import Observation

@Observable
class NameViewModel {
    var names = [String]()

    func loadNames() async {
        // do some async work here
        names = ["BaiChao", "LuMeng"]
    }
}
