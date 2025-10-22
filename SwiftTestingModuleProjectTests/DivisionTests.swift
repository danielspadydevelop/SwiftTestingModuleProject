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
    #expect(result.quotient == 3)
    #expect(result.remainder == 1)
}
