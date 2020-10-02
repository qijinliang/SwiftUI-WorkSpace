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
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    public subscript(index: Int) -> T {
        return elements[index]
    }
    
    public func index(of element: T) -> Int? {
        return indices[element]
    }
    
    public func peek() -> T? {
        return elements.first
    }
    
    public mutating func insert(_ value: T) {
        elements.append(value)
        indices[value] = elements.count - 1
        shifUp(elements.count - 1)
    }
    
    public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
        for value in sequence {
            insert(value)
        }
    }
    
    public mutating func replace(_ value: T, at index: Int) {
        guard index < elements.count else {
            return
        }
        
        assert(isOrderedBefore(value, elements[index]))
        set(value, at: index)
        shifUp(index)
    }
    
    @discardableResult
    public mutating func remove() -> T? {
        if elements.isEmpty {
            return nil
        }else if elements.count == 1 {
            return removeLast()
        }else{
            let value = elements[0]
            set(removeLast(), at: 0)
            shiftDown()
            return value
        }
    }
    
    public mutating func remove(at index: Int) -> T? {
        guard index < elements.count else {
            return nil
        }
        
        let size = elements.count - 1
        if index != size {
            swapAt(index, size)
            shiftDown(index, heapSize: size)
            shifUp(index)
        }
        return removeLast()
    }
    
    public mutating func removeAll() {
        elements.removeAll()
        indices.removeAll()
    }
    
    public mutating func removeLast() -> T {
        guard let value = elements.last else {
            preconditionFailure("Trying to remove element from empty heap")
        }
        indices[value] = nil
        return elements.removeLast()
    }
    
    
    mutating func shifUp(_ index: Int) {
        var childIndex = index
        let child = elements[childIndex]
        var parentIndex = self.parentIndex(of: childIndex)
        
        while childIndex > 0 && isOrderedBefore(child, elements[parentIndex]) {
            set(elements[parentIndex], at: childIndex)
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }
        set(child, at: childIndex)
    }
    
    mutating func shiftDown() {
        shiftDown(0, heapSize: elements.count)
    }
    
    mutating func shiftDown(_ index: Int, heapSize: Int) {
        var parentIndex = index
        while true {
            let leftChildIndex = self.leftChildIndex(of: parentIndex)
            let rightChildIndex = leftChildIndex + 1
            
            var first = parentIndex
            if leftChildIndex < heapSize && isOrderedBefore(elements[leftChildIndex], elements[first]) {
                first = leftChildIndex
            }
            
            if rightChildIndex < heapSize && isOrderedBefore(elements[rightChildIndex], elements[first]) {
                first = rightChildIndex
            }
            
            if first == parentIndex { return }
            
            swapAt(parentIndex, first)
            parentIndex = first
        }
    }
    
    private mutating func set(_ newValue: T, at index: Int) {
        indices[elements[index]] = nil
        elements[index] = newValue
        indices[newValue] = index
    }
    
    private mutating func swapAt(_ i: Int, _ j: Int) {
        elements.swapAt(i, j)
        indices[elements[i]] = i
        indices[elements[j]] = j
    }
    
    @inline(__always)
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    @inline(__always)
    func leftChildIndex(of index: Int) -> Int {
        return 2*index + 1
    }
    
    @inline(__always)
    func rightChildIndex(of index: Int) -> Int {
        return 2*index + 2
    }
}

public struct Message: Hashable {
    let text: String
    let priority: Int
    
    public var hashValue: Int {
        return text.hashValue
    }
    
    public static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.text == rhs.text
    }
    
    static func < (m1: Message, m2: Message) -> Bool {
        return m1.priority < m2.priority
    }
}

var queue = HashedHeap<Message>(sort: <)
queue.isEmpty
(queue.count, 0)
(queue.peek())
queue.remove()


queue.insert(Message(text: "hello", priority: 100))
(queue.isEmpty)
(queue.count, 1)
(queue.peek()!.priority, 100)

let result = queue.remove()
(result!.priority, 100)
(queue.isEmpty)
(queue.count, 0)
(queue.peek())


queue.insert(Message(text: "hello", priority: 100))
queue.insert(Message(text: "world", priority: 200))
(queue.isEmpty)
(queue.count, 2)
(queue.peek()!.priority, 100)

let result1 = queue.remove()
(result1!.priority, 100)
(queue.isEmpty)
(queue.count, 1)
(queue.peek()!.priority, 200)

let result2 = queue.remove()
(result2!.priority, 200)
(queue.isEmpty)
(queue.count, 0)
(queue.peek())


queue.insert(Message(text: "world", priority: 200))
queue.insert(Message(text: "hello", priority: 100))
(queue.isEmpty)
(queue.count, 2)
(queue.peek()!.priority, 100)

(result1!.priority, 100)
(queue.isEmpty)
(queue.count, 1)
(queue.peek()!.priority, 200)

(result2!.priority, 200)
(queue.isEmpty)
(queue.count, 0)
(queue.peek())


//: [Next](@next)
