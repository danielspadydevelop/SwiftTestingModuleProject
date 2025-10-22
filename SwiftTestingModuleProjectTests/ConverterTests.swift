//
//  ConverterTests.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/21/25.
//

import Testing
import Numerics

@testable import SwiftTestingModuleProject

@Test func check32FahrenheitIsZeroCelsius() {
    // given
    let sut = Converter()
    let input = 32.0

    // when
    let celsius = sut.convertToCelsius(fahrenheit: input)

    // then
    #expect(celsius.isApproximatelyEqual(to: 0, absoluteTolerance: 0.000001))
}

@Test func check212FahrenheitIs100Celsius() {
    // given
    let sut = Converter()
    let input = 212.0

    // when
    let celsius = sut.convertToCelsius(fahrenheit: input)

    // then
    #expect(celsius.isApproximatelyEqual(to: 100, absoluteTolerance: 0.000001))
}

@Test func check100FahrenheitIs37Celsius() {
    // given
    let sut = Converter()
    let input = 100.0

    // when
    let celsius = sut.convertToCelsius(fahrenheit: input)

    // then
    #expect(celsius.isApproximatelyEqual(to: 37.777777, absoluteTolerance: 0.000001))
}
