//: [Previous](@previous)

import Foundation

func quicksort<T: Comparable>(_ a: [T]) ->[T]{
    guard a.count > 1 else {
        return a
    }
    
    let pivot = a[a.count/2]
    let less = a.filter{$0 < pivot}
    let equal = a.filter {$0 == pivot }
    let greater = a.filter {$0 > pivot}
    
    return quicksort(less) + equal + quicksort(greater)
}

var list = [10,0,3,9,2,14,8,27,1,5,8,-1,26]

print("方法一排序：",quicksort(list))



func partitionLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[high]
    
    var i = low
    for j in low..<high {
        if a[j] <= pivot {
            a.swapAt(i, j)
            i += 1
        }
    }
    a.swapAt(i, high)
    return i
}


func quicksortLomuto<T: Comparable>(_ a: inout[T], low: Int, high: Int) {
    if low < high {
        let p = partitionLomuto(&a, low: low, high: high)
        quicksortLomuto(&a, low: low, high: p - 1)
        quicksortLomuto(&a, low: p + 1, high: high)
    }
}

var list2 = [10,0,3,9,2,14,8,27,1,5,8,-1,26]
quicksortLomuto(&list2, low: 0, high: list2.count - 1)
print("方法二排序：",list2)


func partitionHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[low]
    var i = low - 1
    var j = high + 1
    
    while true {
        repeat{ j -= 1} while a[j] > pivot
        repeat{ i += 1} while a[i] < pivot
        
        if i < j {
            a.swapAt(i, j)
        }else{
            return j
        }
    }
}

func quicksortHoare<T: Comparable>(_ a: inout[T], low: Int, high: Int) {
    if low < high{
        let p = partitionHoare(&a, low: low, high: high)
        quicksortHoare(&a, low: low, high: p)
        quicksortHoare(&a, low: p + 1, high: high)
    }
}

var list3 = [10,0,3,9,2,14,8,27,1,5,8,-1,26]
quicksortHoare(&list3, low: 0, high: list3.count - 1)
print("方法三排序：",list3)

func quicksortRandom<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let pivotIndex = random(min: low, max: high)
        (a[pivotIndex], a[high]) = (a[high], a[pivotIndex])
        
        let p = partitionLomuto(&a, low: low, high: high)
        quicksortRandom(&a, low: low, high: p - 1 )
        quicksortRandom(&a, low: p + 1, high: high)
    }
    
}

public func random(min: Int, max: Int) -> Int {
    assert(min < max)
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}

var list4 = [10,0,3,9,2,14,8,27,1,5,8,-1,26]
quicksortRandom(&list4, low: 0, high: list4.count - 1)
print("方法四排序：",list4)


func partitionDutchFlag<T: Comparable>(_ a: inout [T], low: Int, high: Int, pivotIndex: Int) -> (Int,Int) {
    let pivot = a[pivotIndex]
    
    var smaller = low
    var equal = low
    var larger = high
    
    while equal <= larger {
        if a[equal] < pivot {
            swap(&a, smaller, equal)
            smaller += 1
            equal += 1
        }else if a[equal] == pivot {
            equal += 1
        }else{
            swap(&a, equal, larger)
            larger -= 1
        }
    }
    return (smaller, larger)
}

func quicksortDutchFlag<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let pivotIndex = random(min: low, max: high)
        let (p,q) = partitionDutchFlag(&a, low: low, high: high, pivotIndex: pivotIndex)
        quicksortDutchFlag(&a, low: low, high: p - 1)
        quicksortDutchFlag(&a, low: q + 1, high: high)
    }
}


public func swap<T>(_ a: inout[T], _ i: Int, _ j: Int) {
    if i != j{
        a.swapAt(i, j)
    }
}

var list5 = [10,0,3,9,2,14,8,27,1,5,8,-1,26]
quicksortDutchFlag(&list5, low: 0, high: list5.count - 1)
print("方法五排序：",list5)

//: [Next](@next)
