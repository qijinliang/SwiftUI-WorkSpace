//: [Previous](@previous)

import Foundation

class Person {
    
    var rediscen: Rediscen?
}

class Rediscen {
    var numberCount = 1
}

let per = Person()

/**
 如果使用叹号（!）强制解包获得这个 per 的 rediscen 属性中的 numberCount 值，会触发运行时错误，因为这时 residence 没有可以解包的值：
 **/
//let Count = per.rediscen!.numberCount
//错误打印
/**
 Fatal error: Unexpectedly found nil while unwrapping an Optional value: file __lldb_expr_28/可选链.xcplaygroundpage
 **/

if let Count = per.rediscen?.numberCount {
    print("\(Count)")
}else {
    print("Unable to retrieve the number of rooms.")
}

//: MARK- 复杂的模型
class Peope {
    var residence: Residence?
}


class Residence {
    var rooms = [Room]()
    var numberCounts:Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    public func printNumberCounts() {
        print("The number is of room is\(numberCounts)")
    }
    
    var address: Address?
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    
}


let person = Peope()
if let Count = person.residence?.numberCounts {
    print("\(Count)")
}else{
    print("Unable to retrieve the Count of rooms.")
}

if person.residence?.printNumberCounts() != nil {
    print("printnumbercount--->")
}else {
    print("printnumbercount--->nil")
}

//: [Next](@next)

