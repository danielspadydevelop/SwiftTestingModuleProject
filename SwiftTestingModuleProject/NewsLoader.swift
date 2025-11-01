//
//  NewsLoader.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/31/25.
//

import Foundation

nonisolated
struct NewsLoader: AsyncSequence, AsyncIteratorProtocol {
    var current = 1

    mutating func next() async -> Data? {
        defer { current += 1 }

        do {
            let url = URL(string: "https://hws.dev/news-\(current).json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            return data.isEmpty ? nil : data
        } catch {
            return nil
        }
    }

    func makeAsyncIterator() -> NewsLoader {
        self
    }
}
