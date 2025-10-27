//
//  DoubleGenerator.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/27/25.
//

nonisolated
struct DoubleGenerator: AsyncSequence, AsyncIteratorProtocol {
    var current = 1

    mutating func next() async -> Int? {
        defer { current &*= 2 }

        if current < 0 {
            return nil
        } else {
            return current
        }
    }

    func makeAsyncIterator() -> DoubleGenerator {
        self
    }
}
