//
//  DivisionTests.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/22/25.
//

@testable import SwiftTestingModuleProject
import Testing

@Test func divisionRemainder() {
    // given
    let dividend = 10
    let divisor = 3

    // when
    let result = divisionRemainder(of: dividend, dividedBy: divisor)

    // then
    verifyDivision(result, expectedQuotient: 3, expectedRemainder: 1)
}

func verifyDivision(_ result: (quotient: Int, remainder: Int), expectedQuotient: Int, expectedRemainder: Int) {
    #expect(result.quotient == expectedQuotient)
    #expect(result.remainder == expectedRemainder)
}
