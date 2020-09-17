//: [Previous](@previous)

import Foundation

public func combSort<T: Comparable>(_ input: [T]) -> [T] {
    var copy: [T] = input
    var gap = copy.count
    let shrink = 1.3
    
    while gap > 1 {
        gap = (Int)(Double(gap) / shrink)
        if gap < 1 {
            gap = 1
        }
        
        var index = 0
        while !(index + gap >= copy.count) {
            if copy[index] > copy[index + gap] {
                copy.swapAt(index, index + gap)
            }
            index += 1;
        }
    }
    return copy
}

fileprivate func swap<T: Comparable>(a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}


var list = [10,0,3,9,2,14,8,27,1,5,8,-1,26]
print("遍历之前的数组：",list)
print("遍历之后的数组：",combSort(list))
//: [Next](@next)
