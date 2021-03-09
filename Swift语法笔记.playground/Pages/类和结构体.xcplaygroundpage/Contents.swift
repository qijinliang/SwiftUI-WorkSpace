//: [Previous](@previous)

import Foundation

struct Person {
    var age: Int = 0
    var name: String = ""
}

var people = Person()
people.name = "jack"
people.age = 11
print("\(people)")

class Clasperson {
    var name: String = ""
    var age: Int = 0
}

var classpeople = Clasperson()
classpeople.age = 17
classpeople.name = "json"
print("\(classpeople)")
//: [Next](@next)
