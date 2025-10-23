//
//  DivisionTests.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/22/25.
//

@testable import SwiftTestingModuleProject
import Testing

@Test(.tags(.division))
func divisionRemainder() {
    // given
    let dividend = 10
    let divisor = 3

    // when
    let result = divisionRemainder(of: dividend, dividedBy: divisor)

    // then
    verifyDivision(result, expectedQuotient: 3, expectedRemainder: 1)
}

@Test(.tags(.division))
func divisors() {
    // given
    let dividend = 10
    let divisor = 3

    // when
    let result = divisionRemainder(of: dividend, dividedBy: divisor)

    // then
    verifyDivision(result, expectedQuotient: 3, expectedRemainder: 1)
}

func verifyDivision(_ result: (quotient: Int, remainder: Int),
                    expectedQuotient: Int, expectedRemainder: Int,
                    sourceLocation: SourceLocation = #_sourceLocation) {
    #expect(result.quotient == expectedQuotient, sourceLocation: sourceLocation)
    #expect(result.remainder == expectedRemainder, sourceLocation: sourceLocation)
}
