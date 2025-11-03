//
//  ConverterTests.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/21/25.
//

import Testing
import Numerics

@testable import SwiftTestingModuleProject

@Test(.tags(.dataHandling))
func check32FahrenheitIsZeroCelsius() {
    // given
    let sut = Converter()
    let input = 32.0

    // when
    let celsius = sut.convertToCelsius(fahrenheit: input)

    // then
    #expect(celsius.isApproximatelyEqual(to: 0, absoluteTolerance: 0.000001))
}

@Test(.tags(.dataHandling))
func check212FahrenheitIs100Celsius() {
    // given
    let sut = Converter()
    let input = 212.0

    // when
    let celsius = sut.convertToCelsius(fahrenheit: input)

    // then
    #expect(celsius.isApproximatelyEqual(to: 100, absoluteTolerance: 0.000001))
}

@Test(.tags(.dataHandling))
func check100FahrenheitIs37Celsius() {
    // given
    let sut = Converter()
    let input = 100.0

    // when
    let celsius = sut.convertToCelsius(fahrenheit: input)

    // then
    #expect(celsius.isApproximatelyEqual(to: 37.777777, absoluteTolerance: 0.000001))
}

@Test("Ensure Fahrenheit to Celsius conversion is correct.", .tags(.measurement), arguments: [
    (32, 0),
    (212, 100),
    (-40, -40),
])
func fahrenheitToCelsiusNamed(values: (input: Double, output: Double)) {
    // given
    let sut = Converter()

    // when
    let celsius = sut.convertToCelsius(fahrenheit: values.input)

    // then
    #expect(celsius.isApproximatelyEqual(to: values.output, absoluteTolerance: 0.000001))
}

@Test(.tags(.measurement), arguments: [
    (32, 0),
    (212, 100),
    (-40, -40)
])
func fahrenheitToCelsius(values: (input: Double, output: Double)) {
    // given
    let sut = Converter()

    // when
    let celsius = sut.convertToCelsius(fahrenheit: values.input)

    // then
    #expect(celsius.isApproximatelyEqual(to: values.output, absoluteTolerance: 0.000001))
}

@Test(arguments: [1, 2, 3], ["red", "green", "blue"])
func combinatorics(first: Int, second: String) {
    print("\(first), \(second)")
}

@Test(.serialized, arguments: [0, 1, 2], ["red", "green", "blue"])
func combinatoricsOrder(first: Int, second: String) {
    print("\(first), \(second)")
}
