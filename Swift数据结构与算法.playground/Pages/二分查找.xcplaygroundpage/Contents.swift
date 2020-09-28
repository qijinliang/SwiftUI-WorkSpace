//: [Previous](@previous)

import Foundation


func linearSearch<T: Equatable>(_ a: [T], _ key: T) -> Int? {
    for i in 0 ..< a.count {
        if a[i] == key {
            return i
        }
    }
    return nil
}


func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound{
        return nil
    }else{
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        if a[midIndex] > key {
            return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
        }else if a[midIndex] < key {
            return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
        }else{
            return midIndex
        }
    }
}

func binarySearch<T: Comparable>(_ a: [T], key: T) -> Int? {
    var lowerBound = 0
    var upperBound = a.count
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        if a[midIndex] == key {
            return midIndex
        }else if a[midIndex] < key {
            lowerBound = midIndex + 1
        }else{
            upperBound = midIndex
        }
    }
    
    return nil
}

let numbers = [11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23]
let sorted = numbers.sorted()
binarySearch(sorted, key: 2, range: 0 ..< sorted.count)
binarySearch(sorted, key: 67, range: 0 ..< sorted.count)
binarySearch(sorted, key: 43, range: 0 ..< sorted.count)
binarySearch(sorted, key: 42, range: 0 ..< sorted.count)

binarySearch(sorted, key: 2)
binarySearch(sorted, key: 67)
binarySearch(sorted, key: 43)
binarySearch(sorted, key: 42)
//: [Next](@next)
