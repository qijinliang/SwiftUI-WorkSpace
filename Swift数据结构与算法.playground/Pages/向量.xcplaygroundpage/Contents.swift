//: [Previous](@previous)

import Foundation

public struct BitSet {
    private(set) public var size: Int
    
    private let N = 64
    public typealias Word = UInt64
    fileprivate(set) public var words: [Word]
    
    public init(size: Int) {
        precondition(size > 0)
        self.size = size
        
        let n = (size + (N - 1)) / N
        words = [Word](repeating: 0, count: n)
    }
    
    private func indexOf(_ i: Int) -> (Int, Word) {
        precondition(i >= 0)
        precondition(i < size)
        
        let o = i / N
        let m = Word(i - o*N) 
        
        return (o, 1 << m)
    }
    
    public mutating func set(_ i: Int) {
        let (j, m) = indexOf(i)
        words[j] |= m
    }
    
    public mutating func clear(_ i: Int) {
        let (j, m) = indexOf(i)
        words[j] &= ~m
    }
    
    public func isSet(_ i: Int) -> Bool {
        let (j, m) = indexOf(i)
        return (words[j] & m) != 0
    }
    
    public subscript(i: Int) -> Bool {
        get { return isSet(i)}
        set { if newValue { set(i) } else { clear(i) } }
    }
    
    public mutating func flip(_ i: Int) -> Bool {
        let (j, m) = indexOf(i)
        words[j] ^= m
        return (words[j] & m) != 0
    }
    
    public mutating func clearAll() {
        for i in 0..<words.count {
            words[i] = 0
        }
    }
    
}


var bits = BitSet(size: 140)
print(bits)
bits[2] = true
bits[99] = true
bits[128] = true



//: [Next](@next)
