//
//  DoubleGenerator.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/27/25.
//

@testable import SwiftTestingModuleProject

import Testing

@Suite("Async Sequence Tests", .timeLimit(.minutes(1)))
struct AsyncSequenceTests {
    @Test("DoubleGenerator should create 63 doubles")
    func doubling() async {
        let generator = DoubleGenerator()
        
        await confirmation(expectedCount: 63) { confirm in
            for await _ in generator {
                confirm()
            }
        }
    }
}
