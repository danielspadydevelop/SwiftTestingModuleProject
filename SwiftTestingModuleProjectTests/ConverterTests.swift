//
//  ConverterTests.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/21/25.
//

import Testing
@testable import SwiftTestingModuleProject

@Test func fahrenheitToCelsius() throws {
    let sut = Converter()

    let input1 = 32.0
    let output1 = sut.convertToCelsius(fahrenheit: input1)
    #expect(output1 == 0)

    let input2 = 212.0
    let output2 = sut.convertToCelsius(fahrenheit: input2)
    #expect(output2 == 100)
}
