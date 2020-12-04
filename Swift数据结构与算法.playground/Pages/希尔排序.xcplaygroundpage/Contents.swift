import Foundation

public func insertionSort(_ list: inout [Int], start: Int, gap: Int) {
    for i in stride(from: (start + gap), to: list.count, by: gap) {
        let currentValue = list[i]
        var pos = i;
        while pos >= gap && list[pos - gap] > currentValue {
            list[pos] = list[pos - gap]
            pos -= gap
        }
        list[pos] = currentValue
    }
}

public func shellSort(_ list: inout [Int]) {
    var sublistCount = list.count / 2
    while sublistCount > 0 {
        for pos in 0..<sublistCount {
            insertionSort(&list, start: pos, gap: sublistCount)
        }
        sublistCount = sublistCount / 2
    }
}

var list = [10,0,3,9,2,14,8,27,1,5,8,-1,26]
shellSort(&list)




