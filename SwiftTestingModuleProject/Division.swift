//
//  Division.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 10/22/25.
//

func divisionRemainder(of number: Int, dividedBy: Int) -> (quotient: Int, remainder: Int) {
    let quotient = number / dividedBy
    let remainder = number % dividedBy
    return (quotient, remainder)
}
