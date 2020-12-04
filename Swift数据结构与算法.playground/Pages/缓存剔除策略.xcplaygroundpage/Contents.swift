//: [Previous](@previous)

import Foundation

public class LRUCache<KeyType: Hashable> {
    private let maxSize: Int
    private var cache: [KeyType: Any] = [:]
    private var priority: LinkedList<KeyType> = LinkedList<KeyType>()
    private var key2node: [KeyType: LinkedList<KeyType>.LinkedListNode<KeyType>] = [:]
    
    public init(_ maxSize: Int) {
        self.maxSize = maxSize
    }
    
    public func get(_ key: KeyType) -> Any? {
        guard let val = cache[key] else {
            return nil
        }
        
        remove(key)
        insert(key, val: val)
        return val
    }
    
    public func set(_ key: KeyType, val: Any) {
        if cache[key] != nil {
            remove(key)
        }else if priority.count >= maxSize, let keyToRemove = priority.last?.value {
            remove(keyToRemove)
        }
        
        insert(key, val: val)
    }
    
    public func remove(_ key: KeyType) {
        cache.removeValue(forKey: key)
        guard let node = key2node[key] else {
            return
        }
        priority.remove(node: node)
        key2node.removeValue(forKey: key)
    }
    
    private func insert(_ key: KeyType, val: Any) {
        cache[key] = val
        priority.insert(key, atIndex: 0)
        guard let first = priority.first else {
            return
        }
        key2node[key] = first
    }
}

public final class LinkedList<T> {
    public class LinkedListNode<T> {
        var value: T
        var next: LinkedListNode?
        weak var previous: LinkedListNode?
        
        public init(value: T) {
            self.value = value
        }
    }
    
    public typealias Node = LinkedListNode<T>
    
    fileprivate var head: Node?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        if var node = head {
            while let next = node.next {
                node = next
            }
            return node
        }else {
            return nil
        }
    }
    
    public var count: Int {
        if var node = head{
            var c = 1
            while let next = node.next {
                node = next
                c += 1
            }
            return c
        }else {
            return 0
        }
    }
    
    public func node(atIndex index: Int) -> Node? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    public subscript(index: Int) -> T {
        let node = self.node(atIndex: index)
        assert(node != nil)
        return node!.value
    }
    
    public func append(_ value: T) {
        let newNode = Node(value: value)
        self.append(newNode as! T)
    }
    
    public func append(_ node: Node) {
        let newNode = LinkedListNode(value: node.value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        }else {
            head = newNode
        }
    }
    
    public func append(_ list: LinkedList) {
        var nodeToCopy = list.head
        while let node = nodeToCopy {
            self.append(node.value)
            nodeToCopy = node.next
        }
    }
    
    public func nodesBeforeAndAfter(index: Int) -> (Node?, Node?) {
        assert(index >= 0)
        
        var i = index
        var next = head
        var prev: Node?
        
        while next != nil && i > 0 {
            i -= 1
            prev = next
            next = next?.next
        }
        
        assert(i == 0)
        return (prev, next)
    }
    
    public func insert(_ value: T, atIndex index: Int) {
        let newNode = Node(value: value)
        self.insert(newNode, atIndex: index)
    }
    
    public func insert(_ node: Node, atIndex index: Int) {
        let (prev, next) = nodesBeforeAndAfter(index: index)
        let newNode = LinkedListNode(value: node.value)
        newNode.previous = prev
        newNode.next = next
        prev?.next = newNode
        next?.previous = newNode
        
        if prev == nil {
            head = newNode
        }
    }
    
    
    
    public func removeAll() {
        head = nil
    }
    
    @discardableResult public func remove(node: Node) -> T {
        let prev = node.previous
        let next = node.next
        
        if let preb = prev {
            prev?.next = next
        }else{
            head = next
        }
        next?.previous = prev
        node.previous = nil
        node.next = nil
        return node.value
    }
}

let cache = LRUCache<String>(2)
cache.set("a", val: 1)
cache.set("b", val: 2)
cache.get("a") // returns 1
cache.set("c", val: 3) // evicts key "b"
cache.get("b") // returns nil (not found)
cache.set("d", val: 4) // evicts key "a"
cache.get("a") // returns nil (not found)
cache.get("c") // returns 3
cache.get("d") // returns 4

//: [Next](@next)
