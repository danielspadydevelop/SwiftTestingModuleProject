//
//  ReadingsViewModel.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 11/2/25.
//

import Foundation

class ReadingsViewModel {
    func loadReadings(completion: @Sendable @escaping ([Double]) -> Void) {
        let url = URL(string: "https://hws.dev/readings.json")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data {
                if let numbers = try? JSONDecoder().decode([Double].self, from: data) {
                    completion(numbers)
                    return
                }
            }

            completion([])
        }.resume()
    }
}
