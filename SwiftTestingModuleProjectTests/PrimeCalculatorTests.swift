//
//  PrimeCalculatorTests.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 11/4/25.
//

@testable import SwiftTestingModuleProject

import XCTest

class PerformanceTest: XCTestCase {
    
    func testPrimePerformance() {
        measure {
            _ = PrimeCalculator.calculate(upTo: 1_000_000)
        }
    }
    
    func testPrimePerformanceGuard() {
        measure {
            _ = PrimeCalculator.calculate(upTo: -1)
        }
    }

}
