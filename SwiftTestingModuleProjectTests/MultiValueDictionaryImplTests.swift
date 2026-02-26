//
//  MultiValueDictionaryImplTests.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 2/26/26.
//

import Testing
@testable import SwiftTestingModuleProject

@MainActor
@Suite("MultiValueDictionaryImpl behavior")
struct MultiValueDictionaryImplTests {

    @Test("addElement returns true on new pair, false on duplicate per key")
    func testAddElementUniquenessPerKey() async throws {
        var dict = MultiValueDictionaryImpl<String, Int>()
        #expect(dict.addElement(withKey: "a", andValue: 1) == true)
        // duplicate value for same key should not modify and returns false
        #expect(dict.addElement(withKey: "a", andValue: 1) == false)
        // same value under different key is allowed and returns true
        #expect(dict.addElement(withKey: "b", andValue: 1) == true)
    }

    @Test("getValues returns sequence for existing key and nil for missing key")
    func testGetValuesPresence() async throws {
        var dict = MultiValueDictionaryImpl<String, Int>()
        #expect(dict.getValues(forKey: "missing") == nil)
        _ = dict.addElement(withKey: "a", andValue: 1)
        _ = dict.addElement(withKey: "a", andValue: 2)
        let seq = try #require(dict.getValues(forKey: "a"))
        let values = Array(seq)
        #expect(values.contains(1))
        #expect(values.contains(2))
        #expect(values.count == 2)
    }

    @Test("removeElement removes only that value and returns tuple; removes key when last value removed")
    func testRemoveElement() async throws {
        var dict = MultiValueDictionaryImpl<String, Int>()
        _ = dict.addElement(withKey: "a", andValue: 1)
        _ = dict.addElement(withKey: "a", andValue: 2)

        // removing existing pair returns tuple
        let removedResult1 = dict.removeElement(forKey: "a", andValue: 1)
        let removed = try #require(removedResult1)
        #expect(removed.0 == "a" && removed.1 == 1)

        // key still has another value
        let remaining = try #require(dict.getValues(forKey: "a"))
        #expect(Array(remaining).sorted() == [2])

        // removing last value removes the key; now values should be nil
        let removedResult2 = dict.removeElement(forKey: "a", andValue: 2)
        let removed2 = try #require(removedResult2)
        #expect(removed2.0 == "a" && removed2.1 == 2)
        #expect(dict.getValues(forKey: "a") == nil)

        // removing non-existing pair returns nil
        let removedResult3 = dict.removeElement(forKey: "a", andValue: 3)
        #expect(removedResult3 == nil)
    }

    @Test("removeValues removes all values for key and returns them as a sequence; nil for missing key")
    func testRemoveValues() async throws {
        var dict = MultiValueDictionaryImpl<String, Int>()
        _ = dict.addElement(withKey: "a", andValue: 1)
        _ = dict.addElement(withKey: "a", andValue: 2)
        _ = dict.addElement(withKey: "b", andValue: 3)

        let removedAResult = dict.removeValues(forKey: "a")
        let removedA = try #require(removedAResult)
        let removedAValues = Set(Array(removedA))
        #expect(removedAValues == Set([1, 2]))
        // key should no longer be valid after removing all values
        #expect(dict.getValues(forKey: "a") == nil)

        // removing values for missing key yields nil
        let removedMissing = dict.removeValues(forKey: "missing")
        #expect(removedMissing == nil)

        // other keys remain unaffected
        let bValues = try #require(dict.getValues(forKey: "b"))
        #expect(Set(Array(bValues)) == Set([3]))
    }

    @Test("Sequence conformance iterates over (key, value) pairs")
    func testSequenceIteration() async throws {
        var dict = MultiValueDictionaryImpl<String, Int>()
        _ = dict.addElement(withKey: "a", andValue: 1)
        _ = dict.addElement(withKey: "a", andValue: 2)
        _ = dict.addElement(withKey: "b", andValue: 3)

        let pairs = Array(dict)
        let pairSet = Set(pairs.map { "\($0.0):\($0.1)" })
        #expect(pairSet == Set(["a:1", "a:2", "b:3"]))
    }
}

