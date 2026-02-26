//
//  MultiValueDictionary.swift
//  SwiftTestingModuleProject
//
//  Created by Daniel Spady on 2/26/26.
//

import Foundation

// Works like a normal dictionary, but each key can be associated
// with multiple, but unique (per key) values. Keys in the dictionary
// should only be valid if they have at least 1 associated value at all times.
protocol MultiValueDictionary: Sequence where Element == (Key, Value) {
    associatedtype Key
    associatedtype Value
    
    // Returns true if the collection is modified; false otherwise.
    // Must return false if (key, value) pair already exists in the dictionary.
    mutating func addElement(withKey: Key, andValue: Value) -> Bool
    
    // Returns any iterable sequence of values associated to a key or nil if key
    // is not in dictionary
    func getValues(forKey: Key) -> AnySequence<Value>?
    
    // Removes and returns key value tuple if exist, otherwise returns nil
    mutating func removeElement(forKey: Key, andValue: Value) -> (Key, Value)?
    
    // Removes all values associated to a key and returns them as any iterable
    // sequence or just returns nil if key is not in the dictionary
    mutating func removeValues(forKey: Key) -> AnySequence<Value>?
    
    // For conformance to the Sequence protocol your type will also have
    // to implement its own makeIterator() method so the dictionary
    // itself can be iterated (such as with a for loop) returning tuples
    // of key/value pairs on each iteration
    func makeIterator() -> AnyIterator<(Key, Value)>
}
/// A concrete implementation of `MultiValueDictionary` that stores unique values per key.
/// - Uses a dictionary of sets to ensure per-key uniqueness.
/// - Keys are automatically removed when they no longer have any associated values.
public struct MultiValueDictionaryImpl<Key: Hashable, Value: Hashable>: MultiValueDictionary {
    public typealias Element = (Key, Value)

    private var storage: [Key: Set<Value>] = [:]

    public init() {}

    // MARK: - MultiValueDictionary

    /// Adds a value for the given key if it doesn't already exist for that key.
    /// - Returns: true if the collection was modified; false otherwise.
    @discardableResult
    public mutating func addElement(withKey key: Key, andValue value: Value) -> Bool {
        var set = storage[key] ?? Set<Value>()
        let (inserted, _) = set.insert(value)
        if inserted {
            storage[key] = set
        }
        return inserted
    }

    /// Returns any iterable sequence of values associated to a key or nil if key is not in dictionary
    public func getValues(forKey key: Key) -> AnySequence<Value>? {
        guard let set = storage[key], !set.isEmpty else { return nil }
        return AnySequence(set)
    }

    /// Removes and returns key/value tuple if it exists; otherwise returns nil.
    @discardableResult
    public mutating func removeElement(forKey key: Key, andValue value: Value) -> (Key, Value)? {
        guard var set = storage[key] else { return nil }
        guard set.remove(value) != nil else { return nil }
        if set.isEmpty {
            storage.removeValue(forKey: key)
        } else {
            storage[key] = set
        }
        return (key, value)
    }

    /// Removes all values associated to a key and returns them as any iterable sequence or nil if key is not in the dictionary
    @discardableResult
    public mutating func removeValues(forKey key: Key) -> AnySequence<Value>? {
        guard let set = storage.removeValue(forKey: key), !set.isEmpty else { return nil }
        return AnySequence(set)
    }

    // MARK: - Sequence

    /// Returns an iterator over (key, value) pairs.
    public func makeIterator() -> AnyIterator<(Key, Value)> {
        // Flatten the dictionary of sets into an array of pairs for iteration stability.
        var iterator = storage.flatMap { (key, values) in values.map { (key, $0) } }.makeIterator()
        return AnyIterator { iterator.next() }
    }
}

