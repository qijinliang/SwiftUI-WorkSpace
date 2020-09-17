//: [Previous](@previous)

import Foundation

func insertionSort<T>(_ array: [T], _ isOrderdBefore: (T,T) -> Bool) -> [T] {
    guard array.count > 1 else {
        return array
    }
    
    var sortedArray = array
    
    for index in 1..<sortedArray.count {
        var currentIndex = index
        let temp = sortedArray[currentIndex]
        while currentIndex > 0 && isOrderdBefore(temp, sortedArray[currentIndex - 1]) {
            sortedArray[currentIndex] = sortedArray[currentIndex - 1]
            currentIndex -= 1
        }
        sortedArray[currentIndex] = temp
    }
    return sortedArray
}

func insertionSort<T: Comparable>(_ array: [T]) -> [T] {
    var sortedArray = array
    for index in 1..<sortedArray.count {
        var currenIndex = index
        let temp = sortedArray[currenIndex]
        while currenIndex > 0 && temp < sortedArray[currenIndex - 1] {
            sortedArray[currenIndex] = sortedArray[currenIndex - 1]
            currenIndex -= 1
        }
        sortedArray[currenIndex] = temp
    }
    return sortedArray
}

var list = [10,0,3,9,2,14,8,27,1,5,8,-1,26]
print(insertionSort(list))
print(insertionSort(list, <))
print(insertionSort(list, >))
//: [Next](@next)
