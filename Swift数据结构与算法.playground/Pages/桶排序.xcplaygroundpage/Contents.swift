//: [Previous](@previous)

import Foundation


public func bucketSort<T>(_ elements: [T], distributor: Distributor, sorter: Sorter, buckets: [Bucket<T>]) -> [T] {
    precondition(allPositiveNumbers(elements))
    precondition(enoughSpaceInBuckets(buckets, elements: elements))
    
    var bucketsCopy = buckets
    
    for elem in elements {
        distributor.distributor(elem, buckets: &bucketsCopy)
    }
    
    var results = [T]()
    
    for bucket in bucketsCopy {
        results += bucket.sort(sorter)
    }
    
    return results
}

private func allPositiveNumbers<T: Sortable>(_ array: [T]) -> Bool {
    return array.filter { $0.toInt() >= 0 }.count > 0
}

private func enoughSpaceInBuckets<T>(_ buckets: [Bucket<T>], elements: [T]) -> Bool {
    let maximumValue = elements.max()?.toInt()
    let totalCapacity = buckets.count * (buckets.first?.capactiy)!
    
    guard let max = maximumValue else {
        return false
    }
    
    return totalCapacity >= max
}

//MARK: Distributor
public protocol Distributor {
    func distributor<T>(_ elements: T, buckets: inout [Bucket<T>])
}

public struct RangeDistributor: Distributor {
    public init() {}
    
    public func distributor<T>(_ element: T, buckets: inout [Bucket<T>]) {
        let value = element.toInt()
        let bucketCapacity = buckets.first!.capactiy
        
        let bucketIndex = value / bucketCapacity
        buckets[bucketIndex].add(element)
    }
}

//MARK: Sortable
public protocol IntConvertible {
    func toInt() -> Int
}

public protocol Sortable: IntConvertible, Comparable {
    
}


//MARK: Sorter
public protocol Sorter {
    func sort<T: Sortable>(_ items: [T]) -> [T]
}

public struct InsertionSorter: Sorter {
    public init() {}
    
    public func sort<T: Sortable>(_ items: [T]) -> [T] {
        var results = items;
        for i in 0 ..< results.count {
            var j = i
            while j > 0 && results[j-1] > results[j] {
                let auxilliar = results[j-1]
                results[j-1] = results[j]
                results[j] = auxilliar
                
                j -= 1
            }
        }
        return results
    }
}

//MARK: Bucket
public struct Bucket<T: Sortable> {
    
    var elements: [T]
    let capactiy: Int
    
    public init(capactiy: Int) {
        self.capactiy = capactiy
        elements = [T]()
    }
    
    public mutating func add(_ item: T) {
        if elements.count < capactiy {
            elements.append(item)
        }
    }
    
    public func sort(_ algorithm: Sorter) -> [T] {
        return algorithm.sort(elements)
    }
}


extension Int: IntConvertible, Sortable {
    public func toInt() -> Int {
        return self
    }
}

let input = [10,0,3,9,2,14,8,27,1,5,8,-1,26]
var buckets = [Bucket<Int>(capactiy: 15), Bucket<Int>(capactiy: 15),Bucket<Int>(capactiy: 15)]
let sortedElements = bucketSort(input, distributor: RangeDistributor(), sorter: InsertionSorter(), buckets: buckets)
print(sortedElements)
//: [Next](@next)
