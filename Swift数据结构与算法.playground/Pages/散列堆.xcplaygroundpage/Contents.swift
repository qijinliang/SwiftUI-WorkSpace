//: [Previous](@previous)

import Foundation

public struct HashedHeap<T: Hashable> {
    private(set) var elements = [T]()
    
    private(set) var indices = [T: Int]()
    
    fileprivate var isOrderedBefore: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
        isOrderedBefore = sort
    }
    
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        isOrderedBefore = sort
        build(from: array)
    }
    
    private mutating func build(from array: [T]) {
        elements = array
        for index in elements.indices {
            indices[elements[index]] = index
        }
        
        for i in stride(from: (elements.count/2 - 1), through: 0, by: -1) {
            shiftDown(i, heapSize: elements.count)
        }
    }
    
    mutating func shiftDown() {
        shiftDown(0, heapSize: elements.count)
    }
    
    mutating func shiftDown(_ index: Int, heapSize: Int) {
        
    }
}

//: [Next](@next)
