//: [Previous](@previous)

import Foundation

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else {
        return array
    }
    
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    return merge(leftPile: leftArray, rightPile: rightArray)
    
}

func merge<T: Comparable>(leftPile: [T], rightPile: [T]) ->[T] {
    var leftIndex = 0
    var rightInex = 0
    var orderedPile = [T]()
    
    if orderedPile.capacity < leftPile.count + rightPile.count {
        orderedPile.reserveCapacity(leftPile.count + rightPile.count)
    }
    
    while true {
        guard leftIndex < leftPile.endIndex else {
            orderedPile.append(contentsOf: rightPile[rightInex..<rightPile.endIndex])
            break
        }
        
        guard rightInex < rightPile.endIndex else {
            orderedPile.append(contentsOf: leftPile[leftIndex..<leftPile.endIndex])
            break
        }
        
        if leftPile[leftIndex] < rightPile[rightInex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }else{
            orderedPile.append(rightPile[rightInex])
            rightInex += 1
        }
    }
    
    return orderedPile
}

var list = [10,0,3,9,2,14,8,27,1,5,8,-1,26]
print(mergeSort(list))

let array = ["Tom","Harry","Ron","Chandler","Moncia"]
print(mergeSort(array))


func mergeSortBottomUp<T>(_ a: [T], _ isOrderedBefore: (T, T)->Bool) -> [T] {
    
    let n = a.count
    var z = [a,a]
    var d = 0
    
    var width = 1
    
    while width < n {
        var i = 0
        while i < n {
            var j = i
            var l = i
            var r = i + width
            
            let lmax = min(l + width, n)
            let rmax = min(r + width, n)
            
            while l < lmax && r < rmax {
                if isOrderedBefore(z[d][l],z[d][r]) {
                    z[1-d][j] = z[d][l]
                    l += 1
                }else{
                    z[1-d][j] = z[d][r]
                    r += 1
                }
                j += 1
            }
            while l < lmax {
                z[1-d][j] = z[d][l]
                j += 1
                l += 1
            }
            while r < rmax {
                z[1-d][j] = z[d][r]
                j += 1
                r += 1
            }
            i += width * 2
        }
        width *= 2
        d = 1 - d
    }
    return z[d]
}

print(mergeSortBottomUp(list, <))

//: [Next](@next)
