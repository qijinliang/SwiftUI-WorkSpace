//: [Previous](@previous)

import Foundation

public func bubbleSort<T>(_ elements: [T], comparison: (T,T) -> Bool) -> [T] {
    var array = elements
    for i in 0..<array.count{
        for j in 1..<array.count - i {
            if comparison(array[j], array[j-1]) {
                let temp = array[j-1]
                array[j-1] = array[j]
                array[j] = temp
            }
        }
    }
    return array
}

var list = [10,0,3,9,2,14,8,27,1,5,8,-1,26]
print("遍历之前的数组：",list)
print("遍历之后的数组：",bubbleSort(list, comparison: <))
print("遍历之后的数组：",bubbleSort(list, comparison: >))
//: [Next](@next)
