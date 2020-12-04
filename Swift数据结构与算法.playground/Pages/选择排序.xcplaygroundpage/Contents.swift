//: [Previous](@previous)

import Foundation

public func selectionSort<T: Comparable>(_ array: [T], _ isOrderedBefore: (T,T) -> Bool) -> [T] {
    guard array.count > 1 else {
        return array
    }
    
    var a = array
    for x in 0..<a.count - 1 {
        var lowest = x
        for y in x + 1 ..< a.count {
            if isOrderedBefore(a[y], a[lowest]) {
                lowest = y
            }
        }
        
        if x != lowest {
            a.swapAt(x, lowest)
        }
    }
    return a
}

var list = [10,0,3,9,2,14,8,27,1,5,8,-1,26]
print(selectionSort(list, <))
//: [Next](@next)
