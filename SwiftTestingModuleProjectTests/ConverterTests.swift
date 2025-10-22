//
//  ConverterTests.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/21/25.
//

import Testing
@testable import SwiftTestingModuleProject

@Test func check32FahrenheitIsZeroCelsius() {
    // given
    let sut = Converter()
    let input = 32.0

    // when
    let celsius = sut.convertToCelsius(fahrenheit: input)

    // then
    #expect(celsius == 0)
}

@Test func check212FahrenheitIs100Celsius() {
    // given
    let sut = Converter()
    let input = 212.0

    // when
    let celsius = sut.convertToCelsius(fahrenheit: input)

    // then
    #expect(celsius == 100)
}
