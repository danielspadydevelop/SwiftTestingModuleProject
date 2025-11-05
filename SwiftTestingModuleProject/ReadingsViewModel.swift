//
//  ReadingsViewModel.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 11/2/25.
//

import Foundation

class ReadingsViewModel {
    func loadReadings(url: URL, completion: @Sendable @escaping ([Double]) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data {
                if let numbers = try? JSONDecoder().decode([Double].self, from: data) {
                    completion(numbers)
                } else {
                    completion([])
                }
            }
        }.resume()
    }
}
