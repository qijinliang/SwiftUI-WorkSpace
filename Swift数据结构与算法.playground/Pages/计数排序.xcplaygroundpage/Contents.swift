//: [Previous](@previous)

import Foundation


enum CountingSorError: Error {
    case arrayEmpty
}

func countingSort(array: [Int]) throws -> [Int] {
    guard array.count > 0 else {
        throw CountingSorError.arrayEmpty
    }
    
    
    let maxElemnet = array.max() ?? 0
    var countArray = [Int](repeating: 0, count: Int(maxElemnet + 1))
    for element in array {
        countArray[element] += 1
    }
    
    for index in 1..<countArray.count {
        let sum = countArray[index] + countArray[index - 1]
        countArray[index] = sum
    }
    print(countArray)
    
    var sortedArray = [Int](repeating: 0, count: array.count)
    for index in stride(from: array.count - 1, through: 0, by: -1) {
        let element = array[index]
        countArray[element] -= 1
        sortedArray[countArray[element]] = element
    }
    return sortedArray
}



try countingSort(array: [ 10, 9, 8, 7, 1, 2, 7, 3 ])

//: [Next](@next)
