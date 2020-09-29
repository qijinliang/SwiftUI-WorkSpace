//: [Previous](@previous)

import Foundation

public struct BitSet {
    private(set) public var size: Int
    
    private let N = 64
    public typealias Word = UInt64
    fileprivate(set) public var words: [Word]
    private let allOnes = ~Word()
    
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
    
    private func lastWorsMask() -> Word {
        let diff = words.count*N - size
        if diff > 0 {
            let mask = 1 << Word(63 - diff)
            return (Word)(mask | (mask - 1))
        }else{
            return allOnes
        }
    }
    
    fileprivate mutating func clearUnusedBits() {
        words[words.count - 1] &= lastWorsMask()
    }
    
    public subscript(i: Int) -> Bool {
        get { return isSet(i)}
        set { if newValue { set(i) } else { clear(i) } }
    }
    
    public mutating func set(_ i: Int) {
        let (j, m) = indexOf(i)
        words[j] |= m
    }
    
    public mutating func setAll() {
        for i in 0..<words.count {
            words[i] = allOnes
        }
        clearUnusedBits()
    }
    
    public mutating func clear(_ i: Int) {
        let (j, m) = indexOf(i)
        words[j] &= ~m
    }
    
    public mutating func clearAll() {
        for i in 0..<words.count {
            words[i] = 0
        }
    }
    
    public func isSet(_ i: Int) -> Bool {
        let (j, m) = indexOf(i)
        return (words[j] & m) != 0
    }
    

    public mutating func flip(_ i: Int) -> Bool {
        let (j, m) = indexOf(i)
        words[j] ^= m
        return (words[j] & m) != 0
    }
    
    
    public var cardinality: Int {
        var count = 0
        for var x in words {
            while x != 0 {
                let y = x & ~(x - 1)
                x = x ^ y
                count += 1
            }
        }
        return count
    }

    public func all1() -> Bool {
        for i in 0..<words.count - 1{
            if words[i] != allOnes { return false }
        }
        return words[words.count - 1] == lastWorsMask()
    }
    
    public func any1() -> Bool {
        for x in words {
            if x != 0 { return true }
        }
        return false
    }
    
    public func all0() -> Bool {
        for x in words {
            if x != 0 { return false }
        }
        return true
    }
}


extension BitSet: Equatable {
    
}

public func == (lhs: BitSet, rhs: BitSet) -> Bool {
    return lhs.words == rhs.words
}


extension BitSet {
    public static var allZeros: BitSet {
        return BitSet(size: 64)
    }
}



var bits = BitSet(size: 140)

print(bits)

bits[2] = true
bits[99] = true
bits[128] = true
bits.cardinality
print(bits)

bits.setAll()
bits.cardinality
print(bits)

print("")

var a = BitSet(size: 4)
var b = BitSet(size: 8)

a.setAll()
a.cardinality
a[1] = false
a[2] = false
a[3] = false

b[2] = true
b[6] = true
b[7] = true

//: [Next](@next)
